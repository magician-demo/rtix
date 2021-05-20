class EventsController < ApplicationController

  def index
    if user_signed_in?
      @organizations = current_user.organizations.all
    end
  end
end