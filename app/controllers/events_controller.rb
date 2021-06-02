class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(status: "published")

    if user_signed_in?
      @organizations = current_user.organizations.all
    end
  end

  def contacts
  end

  def show
    @tickets = Event.find(params[:id]).tickets.sample(5).sort
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
    redirect_to edit_event_ticket_path(@event.id, @event.organization_id), notice: "請接著看票券是否進行修改"
  end

  def destroy
    @event.destroy
    redirect_to events_organization_path(params[:organization_id]), notice: "活動刪除成功！" 
  end

  
  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_time, :end_time, :address, :image, :organization_id, :seats_image)
  end

  def find_event
    @event = current_event
  end

end

