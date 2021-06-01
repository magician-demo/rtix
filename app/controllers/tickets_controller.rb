class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @organization = @event.organization
    @ticket = Ticket.new
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    params.require(:tickets).each do |ticket|
      @permited_ticket = ticket.permit(:name, :price, :amount).to_h  
      #無法讀到ActionController::Parameters裡面的key的解決方法 就是用to_h轉成hash 腦洞開(https://stackoverflow.com/questions/34949505/rails-5-unable-to-retrieve-hash-values-from-parameter/34951198)

      if @permited_ticket[:name].present? && @permited_ticket[:price].present? && @permited_ticket[:amount].present?
        @ticket_record = @event.tickets.new(@permited_ticket)
        @ticket_record.save 
        (@ticket_record[:amount].to_i).times { Seat.create(area: (@ticket_record[:name]), ticket_id: @ticket_record[:id], status: 'for_sale') } 
      end
    end
    redirect_to event_path(params[:event_id]), notice: "活動創建成功!"
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

end
