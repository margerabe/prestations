class Pro < ApplicationRecord
  has_many :pro_prestations, dependent: :delete_all
  has_many :prestations, through: :pro_prestations
  has_many :appointments, dependent: :destroy
  has_many :opening_hours, dependent: :destroy

  validates_presence_of :name
  validates :max_kilometers, numericality: { greater_than: 0 }

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode

  scope :has_prestations, lambda { |references:|
    joins(:prestations)
      .where(prestations: { reference: references })
      .group('pros.id')
      .having("COUNT(prestations.id) >= #{references.length}")
  }

  scope :open_at, lambda { |day:, start_time:, end_time:|
    joins(:opening_hours)
      .where(opening_hours: { day: day })
      .where('opening_hours.starts_at < ? AND opening_hours.ends_at > ?', start_time, end_time)
  }

  scope :available_at, lambda { |start_time:, end_time:|
    joins(:appointments)
      .where('appointments.starts_at NOT BETWEEN ? AND ?', start_time, end_time)
      .where('appointments.ends_at NOT BETWEEN ? AND ?', start_time, end_time)
  }
end
