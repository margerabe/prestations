class AddIdToJoinTables < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings_prestations, :id, :primary_key
    add_column :prestations_pros, :id, :primary_key
  end
end
