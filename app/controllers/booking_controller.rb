class BookingController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = event_tickets.sort
    @seats_count = user_seats.count
    @seat = user_seats.includes(:ticket).includes(:line_item)
    @total_price = total_price
  end

  def show
    @ticket = event_tickets.find(params[:id])
    @seats =
      event_tickets
        .find(params[:id])
        .seats
        .includes(:ticket)
        .sort_by { |seat| seat.id }
    @seat = user_seats.includes(:ticket).includes(:line_item)
    @seats_count = user_seats.count
    @total_price = total_price
  end
end
