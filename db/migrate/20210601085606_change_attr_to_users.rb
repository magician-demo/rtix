class ChangeAttrToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role, :string, default: 'normal'
    remove_column :users, :status
  end
end
