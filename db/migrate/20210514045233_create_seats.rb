class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.string :area
      t.string :status
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
