class CreateBookingPrestations < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_prestations do |t|

      t.timestamps
    end
  end
end
