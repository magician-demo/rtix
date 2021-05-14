class Seat < ApplicationRecord
  belongs_to :ticket
  has_one :line_item
end
