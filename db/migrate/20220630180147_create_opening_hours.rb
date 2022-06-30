class CreateOpeningHours < ActiveRecord::Migration[7.0]
  def change
    create_table :opening_hours do |t|
      t.string :day
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
