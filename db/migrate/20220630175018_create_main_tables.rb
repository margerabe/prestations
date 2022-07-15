class CreateMainTables < ActiveRecord::Migration[7.0]
  def change
    create_table :pros do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :max_kilometers

      t.timestamps
    end

    create_table :prestations do |t|
      t.string :reference
      t.integer :duration

      t.timestamps
    end

    create_table :bookings do |t|
      t.string :email
      t.string :name
      t.datetime :starts_at
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end

    create_table :appointments do |t|
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end

    add_reference :appointments, :pro, foreign_key: true

    create_table :opening_hours do |t|
      t.string :day
      t.time :starts_at
      t.time :ends_at

      t.timestamps
    end

    add_reference :opening_hours, :pro, foreign_key: true
  end
end
