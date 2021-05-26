class ApplicationController < ActionController::Base
  helper_method :seat_status

  #找出使用者的 Cart 沒有就建立一個

  def current_cart
    current_user.cart ? current_user.cart : Cart.new(user_id: current_user.id)
  end

  def current_order
    @order = Order.find(params[:id])
  end

  def booking_event
    @event = Event.find(params[:event_id])
  end

  def current_event
    @event = Event.find(params[:id])
  end
end
