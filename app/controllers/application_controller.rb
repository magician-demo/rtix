class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    current_user.cart ? current_user.cart : Cart.new(user_id: current_user.id)
  end

  def current_order
    @order = Order.find(params[:id])
  end

  def booking_event
    @event = Event.find_by(id: params[:event_id])
  end

  def current_event
    @event = Event.find_by(id: params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :tel])
  end

  def check_order
    if current_order.paid?
      redirect_to dashboards_path
    end

  end

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "你沒有權限進入！"
      redirect_to root_path
    end
  end
  
end
