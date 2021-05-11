class ApplicationController < ActionController::Base
  def check_user!
    redirect_to new_user_session_path, notice: "請先登入！" if not user_signed_in?
  end
end
