class AddNumbersToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :numbers, :integer
  end
end
