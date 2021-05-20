class RemoveQrcodeFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :qrcode, :string
  end
end
