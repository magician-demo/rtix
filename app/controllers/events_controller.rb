class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    if user_signed_in?
      @organizations = current_user.organizations.all
    end
  end

  def show
    # FIXME:這裏event似乎是重複寫了? 
    event = Event.find(params[:id])
    @tickets = Event.find(params[:id]).tickets.sort_by{ |ticket| ticket.id}
    @event = Event.find(params[:id])
  end

  def new
    @organization = current_user.organizations.find_by(id: params[:organization_id])
    @event = @organization.events.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to new_event_ticket_path(@event.id), notice: "請接著繼續設定活動的票券"
    else
      render :new
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event.update(event_params)
    redirect_to events_organization_path(event_params[:organization_id]), notice: "更新成功"
  end

  def destroy
    @event.destroy
    redirect_to events_organization_path(params[:organization_id]), notice: "活動刪除成功！" 
  end


  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_time, :end_time, :address, :image, :organization_id)
  end

  def find_event
    @event = current_event
  end

end

