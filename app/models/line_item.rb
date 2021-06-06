class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :seat
  after_save_commit :variation_increase
  after_destroy_commit :variation_decrease

  private

  def variation_increase
    if seat 
      seat.ticket.amount -= 1
      seat.ticket.save
      seat.select!
    end
  end

  def variation_decrease
    if seat
      if seat.selected?
        seat.ticket.amount += 1
        seat.ticket.save
        seat.return!
      else
        return
      end
    end
  end
  
end
