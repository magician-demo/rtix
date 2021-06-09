class ChangeDefaultValueForStatusInEvents < ActiveRecord::Migration[6.1]
  def change
    change_column_default :events, :status, from: "pending", to: "待發佈" 
  end
end
