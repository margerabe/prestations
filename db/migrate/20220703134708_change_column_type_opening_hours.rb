class ChangeColumnTypeOpeningHours < ActiveRecord::Migration[7.0]
  def change
    change_column :opening_hours, :starts_at, :string
    change_column :opening_hours, :ends_at, :string
  end
end
