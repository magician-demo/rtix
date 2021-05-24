class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.string :event
      t.string :title
      t.text :feedback

      t.timestamps
    end
  end
end
