class TicketsController < ApplicationController
  before_action :find_event
  before_action :find_organization, except: [:update]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @event.tickets.new(ticket_params)
    @organization = current_user.organizations.find_by(user_id: current_user.id)

    if @ticket.save
      (@ticket.amount).times { Seat.create(area: (@ticket.name).to_s, ticket_id: @ticket.id, status: 'for_sale') }
      redirect_to event_path(@event.id), notice: "創建成功！"
    else
      redirect_to events_organization_path(@event.id)
    end
  end

  def edit
    @ticket = Ticket.find_by(id: params[:id])
    # @event = @ticket.event(id: @ticket.event_id)
  end

  def update
    @ticket = Ticket.find_by(id: params[:id])
    
    @ticket.update(ticket_params)
    
    redirect_to events_organization_path(@ticket.event.organization, @ticket.event.id), notice: "更新成功"
  end

  private
  def ticket_params
    params.require(:ticket).permit(:name, :price, :amount)
  end

  def find_event
    @event = current_user.organizations.find_by(user_id: current_user.id).events.find_by(id: params[:event_id])
  end

  def find_organization
    @organization = current_user.organizations.find_by(user_id: current_user.id)
  end
end
