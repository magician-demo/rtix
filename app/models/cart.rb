class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :seats, through: :line_items
end
