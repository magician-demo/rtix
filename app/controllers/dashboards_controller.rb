class DashboardsController < ApplicationController
    def index
        @events = User.find(2).events
    end

    def mockup
    end
end
