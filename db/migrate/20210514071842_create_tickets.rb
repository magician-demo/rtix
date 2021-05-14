class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :amount
      t.integer :price
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
