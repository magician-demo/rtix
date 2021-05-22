class RemoveUserFromTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :user_id, :integer
  end
end
