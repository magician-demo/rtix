class AddEmailToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :email, :string
  end
end
