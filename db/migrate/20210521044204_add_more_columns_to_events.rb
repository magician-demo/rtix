class AddMoreColumnsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :location, :string
    add_column :events, :address, :string
    add_column :events, :s_year, :string
    add_column :events, :s_month, :string
    add_column :events, :s_date, :string
    add_column :events, :s_time, :string
    add_column :events, :e_year, :string
    add_column :events, :e_month, :string
    add_column :events, :e_date, :string
    add_column :events, :e_time, :string
  end
end
