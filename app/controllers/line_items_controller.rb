class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = user_cart
    seat = Seat.find(params[:seat_id])
    line_item = cart.line_items.new(seat_id: seat.id)
    if line_item.save
      render json: {status: 'selected'}
    else
      render json: {status: 'error'}
    end
  end
end