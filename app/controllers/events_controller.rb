class EventsController < ApplicationController
  def index
  end

  def show
    @tickets = Event.find(params[:id]).tickets.sort_by{ |ticket| ticket.id}
  end

  def new
    @event = Event.new
  end
end
