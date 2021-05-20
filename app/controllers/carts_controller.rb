class CartsController < ApplicationController
  # 清空購物車的路徑
  def destroy
    current_user.cart.seats.each do |seat|
      seat.ticket.amount += 1
      seat.ticket.save
      seat.update(status: 'for_sale')
      seat.line_item.delete
    end
  end
end