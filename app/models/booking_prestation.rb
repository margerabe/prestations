class BookingPrestation < ApplicationRecord
  belongs_to :booking
  belongs_to :prestation
end
