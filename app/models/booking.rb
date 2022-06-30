class Booking < ApplicationRecord
  has_many :booking_prestations
  has_many :prestations, through: :booking_prestations
end
