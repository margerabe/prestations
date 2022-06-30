class CreateJoinTableProsPrestations < ActiveRecord::Migration[7.0]
  def change
    create_join_table :pros, :prestations do |t|
      t.index :pro_id
      t.index :prestation_id
    end
  end
end
