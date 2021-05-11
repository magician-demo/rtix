class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :title
      t.text :descraption
      t.datetime :deleted_at, default: nil
      t.integer :user_id

      t.timestamps
    end
  end
end
