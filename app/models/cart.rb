class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :seats, through: :line_items

  def empty?
    line_items.count == 0
  end

  def total_price
    seats.reduce(0) { |sum, seat| sum + seat.ticket.price }
  end

  def seat_return!
    seats.each { |seat| seat.line_item.destroy }
  end
end
