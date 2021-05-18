class CartsController < ApplicationController
  before_action :authenticate_user!

  helper_method :seat_status
  def create
    cart = user_cart
    seat = Seat.find(params[:seat_id])
    ticket = seat.ticket
    order_item = cart.order_items.new(seat_id: params[:seat_id])
    if order_item.save
      ticket.amount -= 1
      ticket.save
      seat.update(status: 'selected')
      render json: {area: seat.area, id: seat.id, price: seat.ticket.price, itemId: order_item.id, total_price: total_price}
      response.headers['Access-Control-Allow-Origin'] = '*'
    else
      render json: {status: 'error'}
    end
  end


  def destroy
    order_item = OrderItem.find(params[:id])
    seat = order_item.seat
    ticket = seat.ticket
    if order_item.destroy
      seat.update(status: 'for_sale')
      ticket.amount += 1
      ticket.save
      render json: {total_price: total_price}
      response.headers['Access-Control-Allow-Origin'] = '*'
    else
      render json: {status: 'error'}
    end
  end


  def empty_cart
    order_items = user_cart.order_items
    order_items.each do |l|
        l.seat.update(status: 'for_sale')
        l.seat.ticket.amount += 1
        l.seat.ticket.save
        l.destroy
      end
    redirect_to events_path
  end
  


  

  def checkout
    @order = Order.new
  end
end