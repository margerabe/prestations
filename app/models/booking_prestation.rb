class BookingPrestation < ApplicationRecord
  self.table_name = 'bookings_prestations'

  belongs_to :booking
  belongs_to :prestation
end
