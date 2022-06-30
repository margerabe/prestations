class AddReferencesPro < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :pro
    add_reference :opening_hours, :pro
  end
end
