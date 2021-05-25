class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :seat
  after_save_commit :variation_increase
  after_destroy_commit :variation_decrease


  private
  def variation_increase
    seat.ticket.amount -= 1
    seat.ticket.save
    seat.update(status: 'selected')
  end

  def variation_decrease
    seat.ticket.amount += 1
    seat.ticket.save
    seat.update(status: 'for_sale')
  end
end
