class CheckinsController < ApplicationController
    def new
        @user = User.new 
    end

    def create 
        @name = params[:user][:name]
        @tel = params[:user][:tel]
        @email = params[:user][:email]

        
        if Ticket.pluck(:name).include?("#{@name}")
            redirect_to checkins_path, notice: "感謝您為防疫盡一份心力!!!"
        else 
            redirect_to new_checkin_path, notice: '找不到您的資料呢'
        end
    end

    def index
    end
end
