class RenameOrgCol < ActiveRecord::Migration[6.1]
  def change
    rename_column :organizations, :descraption, :description
  end
end
