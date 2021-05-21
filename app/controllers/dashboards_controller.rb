class DashboardsController < ApplicationController
    def index
        @user = User.find(2)
        @user_events = @user.events

        @hosts = @user.organizations

        @best_events = Event.all.order(id: :desc)
    end

end
