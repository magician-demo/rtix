class RemoveColumnsFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :s_year, :string
    remove_column :events, :s_month, :string
    remove_column :events, :s_date, :string
    remove_column :events, :s_time, :string
    remove_column :events, :e_year, :string
    remove_column :events, :e_month, :string
    remove_column :events, :e_date, :string
    remove_column :events, :e_time, :string
  end
end
