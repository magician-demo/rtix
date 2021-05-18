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

  def empty_cart
    redirect_to event_path(user_cart.seats.first.ticket.id)
    seats = user_cart.seats
    seats.update(status: 'for_sale')
    seats.each do |s|
      s.ticket.amount += 1
      s.ticket.save
    end
    user_cart.line_items.destroy_all
  end

  def random_create
    params[:ticketCount].each do |k|
    num = 0
    id_array = Ticket.find(k[0].to_i).seats.where(status: 'for_sale').ids.sort
      k[1].to_i.times do
        seat = Ticket.find(k[0].to_i).seats.where(status: 'for_sale').find(id_array[num])
        ticket = Ticket.find(k[0].to_i)
        line_item = user_cart.line_items.new(seat_id: seat.id)
          if line_item.save
            ticket.amount -= 1
            ticket.save
            seat.update(status: 'selected')
          end
        num += 1  
      end
    end
    # render json: {seatId: slicer[0], seatArea: slicer[1], seatPrice:slicer[2]}
  end


  # private
  # def slicer
  #   seat_id = []
  #   seat_area = []
  #   seat_price = []
  #   user_cart.seats.each do |seat|
  #     seat_id << seat.id
  #     seat_area << seat.area
  #     seat_price << seat.ticket.price
  #   end
  #   return seat_id, seat_area, seat_price
  # end
end