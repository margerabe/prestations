class Booking < ApplicationRecord
  has_many :booking_prestations, dependent: :delete_all
  has_many :prestations, through: :booking_prestations
end
