class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    seat = Seat.find(params[:seat_id])
    ticket = seat.ticket
    line_item = user_cart.line_items.new(seat_id: params[:seat_id])
    if line_item.save
      ticket.amount -= 1
      ticket.save
      seat.update(status: 'selected')
      render json: {area: seat.area, id: seat.id, price: seat.ticket.price, itemId: line_item.id, total_price: total_price}
    else
      render json: {status: 'error'}
    end
  end


  def destroy
    line_item = LineItem.find(params[:id])
    seat = line_item.seat
    ticket = seat.ticket
    if line_item.destroy
      seat.update(status: 'for_sale')
      ticket.amount += 1
      ticket.save
      render json: {total_price: total_price}
    else
      render json: {status: 'error'}
    end
  end


  def random_create
    params[:ticketCount].each do |every|
    for_sale_ticket = Ticket.find(every[0].to_i).seats.where(status: 'for_sale')
    num = (for_sale_ticket.ids.count / 2).ceil
    id_array = for_sale_ticket.ids.sort
      every[1].to_i.times do
        seat = for_sale_ticket.find(id_array[num])
        ticket = Ticket.find(every[0].to_i)
        line_item = user_cart.line_items.new(seat_id: seat.id)
          if line_item.save
            ticket.amount -= 1
            ticket.save
            seat.update(status: 'selected')
          end
        num += 1  
      end
    end
  end
end