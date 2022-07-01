class Booking < ApplicationRecord
  has_many :booking_prestations, dependent: :delete_all
  has_many :prestations, through: :booking_prestations

  validates_presence_of :name
  validates :email, format: { with: /\A(\S+)@(([a-z]{3,})\.([a-z]{2,}))\z/ }
end
