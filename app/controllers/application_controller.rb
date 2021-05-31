class ApplicationController < ActionController::Base
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

  def check_admin
    redirect_to root_path, notice: "你沒有權限進入" if current_user.role != 'admin'
  end
end
