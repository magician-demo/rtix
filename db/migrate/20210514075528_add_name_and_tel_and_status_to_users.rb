class AddNameAndTelAndStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :tel, :string
    add_column :users, :status, :string
  end
end
