class EventsController < ApplicationController

  def index
    if user_signed_in?
      @organizations = current_user.organizations.all
    end
  end

  def show
    event = Event.find(params[:id])
    @tickets = event.tickets.order(:id)
  end

  def new
    @event = Event.new
  end
end

