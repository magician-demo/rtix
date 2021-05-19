class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = user_cart
    seat = Seat.find(params[:seat_id])
    ticket = seat.ticket
    line_item = cart.line_items.new(seat_id: params[:seat_id])
    if line_item.save
      ticket.amount -= 1
      ticket.save
      seat.update(status: 'selected')
      render json: {area: seat.area, id: seat.id, price: seat.ticket.price, itemId: line_item.id, total_price: total_price}
      response.headers['Access-Control-Allow-Origin'] = '*'
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
      response.headers['Access-Control-Allow-Origin'] = '*'
    else
      render json: {status: 'error'}
      p "123456"
      p "==============================="
    end
  end


  def empty_cart
    line_items = user_cart.line_items
    line_items.each do |l|
        l.seat.update(status: 'for_sale')
        l.seat.ticket.amount += 1
        l.seat.ticket.save
        l.destroy
      end
    redirect_to events_path
  end
end