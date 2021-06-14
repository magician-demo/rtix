class BookingController < ApplicationController
  before_action :authenticate_user!

  def index
    @event = booking_event
    @tickets = booking_event.tickets.sort
    @seats_count = current_cart.seats.count
    @seat = current_cart.seats.includes(:ticket).includes(:line_item)
    @total_price = current_cart.total_price
  end

  def show
    @ticket = booking_event.tickets.find(params[:id])
    @seats =
      booking_event.tickets.find(params[:id]).seats.sort_by { |seat| seat.id }
    @seat = current_cart.seats.includes(:ticket).includes(:line_item)
    @seats_count = current_cart.seats.count
    @total_price = current_cart.total_price
  end
end
