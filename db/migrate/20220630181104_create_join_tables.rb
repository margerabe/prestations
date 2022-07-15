class CreateJoinTables < ActiveRecord::Migration[7.0]
  def change
    create_join_table :pros, :prestations do |t|
      t.index :pro_id
      t.index :prestation_id
    end

    create_join_table :bookings, :prestations do |t|
      t.index :booking_id
      t.index :prestation_id
    end

    add_column :bookings_prestations, :id, :primary_key
    add_column :prestations_pros, :id, :primary_key
  end
end
