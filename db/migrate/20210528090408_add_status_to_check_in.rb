class AddStatusToCheckIn < ActiveRecord::Migration[6.1]
  def change
    add_column :check_ins, :status, :string
  end
end
