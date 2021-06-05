class TicketsController < ApplicationController
  def new
    @event = Event.find_by(id: params[:event_id])
    @organization = @event.organization
    @ticket = Ticket.new
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    params.require(:tickets).each do |ticket|
      @permited_ticket = ticket.permit(:name, :price, :amount).to_h  

      if @permited_ticket[:name].present? && @permited_ticket[:price].present? && @permited_ticket[:amount].present?
        @ticket_record = @event.tickets.new(@permited_ticket)
        @ticket_record.save 
        (@ticket_record[:amount].to_i).times { Seat.create(area: (@ticket_record[:name]), ticket_id: @ticket_record[:id], status: 'for_sale') } 
      end
    end
    redirect_to event_path(params[:event_id]), notice: "活動創建成功!"
  end

  def edit 
    @event = Event.find_by(id: params[:event_id])
    @ticket = @event.tickets.find_by(id: params[:id])
    @organization = @event.organization
  end

  def update
    event = Event.find(params[:event_id])
    @ticket = Ticket.find_by(id: params[:ticket_id])
    @ticket.update(ticket_params)
    redirect_to events_organization_path(event.organization_id), notice: "票券更新成功!"
  end

  private
  def ticket_params
    params.require(:tickets).first.permit(:name, :price, :amount)
  end
end
