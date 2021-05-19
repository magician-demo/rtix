class CartsController < ApplicationController
  def destroy
    current_user.cart.seats.each do |seat|
      seat.ticket.amount += 1
      seat.ticket.save
      seat.update(status: 'for_sale')
      seat.line_item.delete
    end
  end
end