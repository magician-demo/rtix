class EventsController < ApplicationController

  def index
    if user_signed_in?
      @organizations = current_user.organizations.all
    end
  end


  def show
    @tickets = Event.find(params[:id]).tickets.sort_by{ |ticket| ticket.id}
  end

  def new
    @event = Event.new
  end
end

