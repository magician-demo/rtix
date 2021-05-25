class EventsController < ApplicationController
  def index; end

  def show
    event = Event.find(params[:id])
    @tickets = event.tickets.sort_by { |ticket| ticket.id }
  end

  def new
    @event = Event.new
  end
end
