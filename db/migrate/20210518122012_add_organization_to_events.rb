class AddOrganizationToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :organization, null: false, default: 2, foreign_key: true
  end
end
