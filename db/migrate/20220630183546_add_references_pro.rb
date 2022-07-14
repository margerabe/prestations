class AddReferencesPro < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :pro, foreign_key: true
    add_reference :opening_hours, :pro, foreign_key: true
  end
end
