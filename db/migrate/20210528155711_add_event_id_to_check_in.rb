class AddEventIdToCheckIn < ActiveRecord::Migration[6.1]
  def change
    add_column :check_ins, :event_id, :integer
    add_index :check_ins, :event_id
  end
end
