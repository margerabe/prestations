class Booking < ApplicationRecord
  has_many :booking_prestations, dependent: :delete_all
  has_many :prestations, through: :booking_prestations

  validates_presence_of :name
  validates :email, format: { with: /\A^[A-Za-z0-9+_.-]+@(.+)$\z/ }

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode
end
