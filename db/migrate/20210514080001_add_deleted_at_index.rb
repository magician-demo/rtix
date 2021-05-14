class AddDeletedAtIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :organizations, :deleted_at
  end
end
