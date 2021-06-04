class AddSeatsImageToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :seats_image, :string
  end
end
