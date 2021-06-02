class CheckinController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def show
    @seat = CheckIn.find(params[:id]).seat
  end

  def update
    @check_in = CheckIn.find(params[:id])
    if @check_in.pending?
      @check_in.use!
      render json: {event_id: @check_in.event_id}
    else
      render json: {errors: 'alread used!'}
    end
  end

  def checkin_list
    @events = Event.all
    @check_in = CheckIn.where(event_id: params[:id])
  end

end