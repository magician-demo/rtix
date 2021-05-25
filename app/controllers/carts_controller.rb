class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @seats = current_cart.seats
    @total_price = current_cart.total_price
    @current_cart = current_cart
    @event_all = Event.all
    @ticket_count = current_cart.seats.count
  end

  def checkout
    @order = Order.new
  end

  # 清空購物車的路徑
  def destroy
    current_user.cart.seat_return!
  end
end
