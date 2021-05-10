class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :organization, null: false, foreign_key: true
      t.integer :numbers

      t.timestamps
    end
  end
end
