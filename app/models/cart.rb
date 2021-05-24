class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :seats, through: :line_items

  def empty?
    line_items.count == 0
  end
end
