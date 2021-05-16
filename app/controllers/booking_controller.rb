class BookingController < ApplicationController
  before_action :authenticate_user!
  def index
    @tickets = current_event.tickets.sort_by{ |ticket| ticket.id}
  end

  def show
    @ticket = current_event.tickets.find(params[:id])
    @seats = current_event.tickets.find(params[:id]).seats.sort_by{ |seat| seat.id}
    @seat = user_cart.seats
    @ticket_count = user_cart.seats.count
    @total_price = total_price
  end
end