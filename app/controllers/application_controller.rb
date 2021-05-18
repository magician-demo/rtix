class ApplicationController < ActionController::Base
  helper_method :seat_status
  
  def user_cart
    if current_user.cart
      current_user.cart
    else
      Cart.new(user_id: current_user.id)
    end
  end

  def current_event
    @event = Event.find(params[:event_id])
  end

  def seat_status(id)
    Seat.find(id).status
  end

  def total_price
    sum = 0
    user_cart.seats.each do |s|
      sum += s.ticket.price
    end
    sum
  end
  
end
