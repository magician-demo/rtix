class ApplicationController < ActionController::Base
  helper_method :seat_status
  def user_cart
    current_user.cart
  end

  def current_event
    @event = Event.find(params[:event_id])
  end

  def seat_status(id)
    Seat.find(id).status
  end
end
