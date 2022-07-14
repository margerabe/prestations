class Booking < ApplicationRecord
  has_many :booking_prestations, dependent: :delete_all
  has_many :prestations, through: :booking_prestations

  validates_presence_of :name
  validates :email, format: { with: /\A^[A-Za-z0-9+_.-]+@(.+)$\z/ }

  after_create :geocode
  acts_as_mappable lat_column_name: :lat,
                   lng_column_name: :lng

  private

  def geocode
    response = GeocodingService.new(address).call
    self.lat = response[:lat]
    self.lng = response[:lng]
    save
  end
end
