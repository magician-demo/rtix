class BookingController < ApplicationController
  before_action :authenticate_user!
  def index
      @tickets = current_event.tickets
  end

  def show
    @ticket = current_event.tickets.find(params[:id])
    @seats = current_event.tickets.find(params[:id]).seats
    @seat = current_user.cart.seats
  end


  private
  def current_event
    @event = Event.find(params[:event_id])
  end
end