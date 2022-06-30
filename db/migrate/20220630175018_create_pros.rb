class CreatePros < ActiveRecord::Migration[7.0]
  def change
    create_table :pros do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :max_kilometers

      t.timestamps
    end
  end
end
