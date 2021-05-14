class BookingController < ApplicationController
  before_action :authenticate_user!
  def index
      @tickets = current_event.tickets
  end

  def show
    @ticket = current_event.tickets.find(params[:id])
    @seats = current_event.tickets.find(params[:id]).seats.sort_by{ |seat| seat.id}
    @seat = current_user.cart.seats
    @ticket_count = current_user.cart.seats.count
  end
end