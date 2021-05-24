class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :seat_status
  #找出使用者的 Cart 沒有就建立一個
  def user_cart
    if current_user.cart
      current_user.cart
    else
      Cart.new(user_id: current_user.id)
    end
  end


  

  def current_order
    @order = Order.find(params[:id])
  end


  def current_event
    @event = Event.find(params[:event_id])
  end

  #主要幫助前端渲染使用
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

  def user_seats
    user_cart.seats
  end

  def event_tickets
    current_event.tickets
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end





