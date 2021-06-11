class CheckInIdBelongsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :check_ins, :events, column: :event_id
  end
end
