class AddQrcodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :qrcode, :string
  end
end
