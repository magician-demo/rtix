class AddOrganizationToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :organization, null: true, foreign_key: true
  end
end
