class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :seat
  after_save_commit :variation_increase
  after_destroy_commit :variation_decrease

  private

  def variation_increase
    if seat
      Seat.transaction do
        seat.lock!
        seat.ticket.amount -= 1
        seat.ticket.save
        seat.select!
        seat.save!
      end
    end
  end

  def variation_decrease
    if seat.selected?
      Seat.transaction do
        seat.lock!
        seat.ticket.amount += 1
        seat.ticket.save
        seat.return!
        seat.save!
      end
    end
  end
end
