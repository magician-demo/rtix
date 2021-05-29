class EventsController < ApplicationController
  before_action :find_event, only: [:edit, :update, :destroy]
  before_action :find_organization, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
    if user_signed_in?
      @organizations = current_user.organizations.all
    end
  end

  def show
    event = Event.find(params[:id])
    @tickets = Event.find(params[:id]).tickets.sort_by{ |ticket| ticket.id}
    @event = Event.find(params[:id])
  end

  def new
    if current_user.organizations.find_by(user_id: current_user.id)
      
      @event = Event.new 
      @organization = current_user.organizations.find_by(user_id: current_user.id)     
    else
      redirect_to new_organization_path
    end
  end

  def create
    
    @event = current_user.organizations.find_by(user_id: current_user.id).events.new(event_params)

    if @event.save
      redirect_to new_ticket_path, notice: "創建成功！"
    else
      render :new
    end
  end

  def edit
    # @organization = current_user.organizations.find_by(user_id: current_user.id)
    # @event = current_event
  end

  def update
    # @event = current_event
    @event.update(event_params)
    
    redirect_to events_organization_path(@organization), notice: "更新成功"
  end

  def destroy
    @event.destroy
    @event.tickets.destroy
    redirect_to events_organization_path(@organization), notice: "活動刪除成功！" 
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :s_time, :e_time, :address)
  end

  def find_event
    @event = current_event
  end

  def find_organization
    @organization = current_user.organizations.find_by(user_id: current_user.id)
  end
end

