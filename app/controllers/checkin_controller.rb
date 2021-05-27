class CheckinController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
  end

  def show
    @seat = CheckIn.find(params[:id]).seat
  end
end