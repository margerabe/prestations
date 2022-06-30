class Booking < ApplicationRecord
  has_many :booking_prestations, dependent: :destroy
  has_many :prestations, through: :booking_prestations
end
