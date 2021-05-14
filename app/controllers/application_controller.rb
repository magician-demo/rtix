class ApplicationController < ActionController::Base
  def user_cart
    current_user.cart
  end
end
