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
      render json: {status: 'selected'}
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
      render json: {status: 'for_sale'}
    else
      render json: {status: 'error'}
    end
    # seat = Seat.find(params[:seat_id])
    # ticket = seat.ticket
    # if user_cart.line_items.find_by(seat_id: params[:seat_id]).destroy
    #   ticket.amount += 1
    #   ticket.save
    #   seat.update(status: 'for_sale')
    #   render json: {status: 'for_sale'}
    # else
    #   render json: {status: 'error'}
    # end
  end
end