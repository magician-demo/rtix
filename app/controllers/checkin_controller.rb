class CheckinController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @check_in = CheckIn.all.includes(:seat)
  end

  def show
    @seat = CheckIn.find(params[:id]).seat
  end

  def update
    @check_in = CheckIn.find(params[:id])
    if @check_in.pending?
      @check_in.use!
    else
      render json: {errors: 'alread used!'}
    end
  end

end