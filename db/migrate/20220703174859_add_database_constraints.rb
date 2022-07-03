class AddDatabaseConstraints < ActiveRecord::Migration[7.0]
  def change
    change_column_null :pros, :name, false
    change_column_null :prestations, :reference, false
    add_index :prestations, :reference, unique: true
    add_check_constraint :pros, "max_kilometers > 0", name: "max_kilometers_check"
  end
end
