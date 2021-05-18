class AddItemListToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :itemList, :text
  end
end
