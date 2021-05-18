class RenameOrder < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :itemList, :item_list
  end
end
