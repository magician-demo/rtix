class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :serial
      t.string :receiver
      t.string :tel
      t.string :status
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :totalAmount
      t.string :checkMacValue
      t.text :item_list

      t.timestamps
    end
  end
end
