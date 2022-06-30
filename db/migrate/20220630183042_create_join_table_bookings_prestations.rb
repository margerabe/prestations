class CreateJoinTableBookingsPrestations < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bookings, :prestations do |t|
      t.index :booking_id
      t.index :prestation_id
    end
  end
end
