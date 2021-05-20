class AddQrcodeToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :qrcode, :string
  end
end
