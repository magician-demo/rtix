class AddOrderTime < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :ordertime, :string
  end
end
