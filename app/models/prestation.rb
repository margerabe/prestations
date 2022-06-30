class Prestation < ApplicationRecord
  has_many :pro_prestations
  has_many :pros, through: :pro_prestations
  has_many :booking_prestations
  has_many :bookings, through: :booking_prestations
end
