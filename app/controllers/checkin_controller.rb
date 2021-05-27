class CheckinController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @events = Event.all
  end

  def per_ticket
    
  end
end