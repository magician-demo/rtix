class DashboardsController < ApplicationController
    def index
        @user = User.find(2)
        @tickets = @user.tickets
        #to use params[:id] to be dynamic 
        @hosts = @user.organizations
        @events = Event.all.order(id: :desc)
         
    end

    def show
    end
end
