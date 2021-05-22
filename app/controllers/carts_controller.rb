class CartsController < ApplicationController
  before_action :authenticate_user!
  helper_method :seat_status

  def show
    @seats = current_user.cart.seats
    @total_price = total_price
    @current_cart = current_user.cart
    @event_all = Event.all
    @ticket_count = user_cart.seats.count
    
  end



  def checkout
    @order = Order.new
  end
  
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