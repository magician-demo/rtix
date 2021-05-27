class CreateCheckIns < ActiveRecord::Migration[6.1]
  def change
    create_table :check_ins do |t|
      t.references :seat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
