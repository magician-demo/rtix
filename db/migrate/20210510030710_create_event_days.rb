class CreateEventDays < ActiveRecord::Migration[6.1]
  def change
    create_table :event_days do |t|
      t.references :event, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
