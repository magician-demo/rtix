class AddEventsTag < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :tag, :string
  end
end
