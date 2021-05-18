class CartsController < ApplicationController
  before_action :authenticate_user!
  helper_method :seat_status

  def show
    @seats = current_user.cart.seats
    @total_price = total_price
    @event_id = current_user.cart.seats.first.ticket.event.id
    
  end




  def empty_cart
    redirect_to event_path(user_cart.seats.first.ticket.id)
    seats = user_cart.seats
    seats.update(status: 'sold')
    seats.each do |s|
      s.ticket.amount += 1
      s.ticket.save
    end
    user_cart.line_items.destroy_all
  end



  def checkout
    @order = Order.new
  end
end