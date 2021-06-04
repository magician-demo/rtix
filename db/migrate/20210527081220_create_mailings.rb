class CreateMailings < ActiveRecord::Migration[6.1]
  def change
    create_table :mailings do |t|
      t.string :title
      t.string :recipient
      t.string :content
      t.string :qrcode

      t.timestamps
    end
  end
end
