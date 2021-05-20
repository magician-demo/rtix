class DashboardsController < ApplicationController
    def index
        @user = User.find(2)
        @tickets = @user.tickets
        @hosts = @user.organizations
        @events = Event.all.order(id: :desc)
    end

    def show
    end
end
