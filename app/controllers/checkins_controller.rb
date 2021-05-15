class CheckinsController < ApplicationController
    def new
        @user = User.new 
    end

    def create 
        @name = params[:user][:name]
        @email = params[:user][:email]
        @tel = params[:user][:tel]
        @event = params[:user][:event]

        if Ticket.pluck(:name).include?("#{@name}") && Ticket.pluck(:email).include?("#{@email}") && Event.pluck(:title).include?("#{@event}")
            session[:name] = @name 
            session[:email] = @email
            session[:event] = @event 
            redirect_to checkins_path, notice: "感謝您如約前來 也謝謝您為防疫盡一份心力!!!"
        else
            @event = Event.find_by(title: "Demo Day")
            @newuser = User.new(name: @name, email: @email, tel: @tel)
            @newticket = Ticket.new(name: @name, amount: 50, price: 0 )
            redirect_to checkins_path, notice: '今生有緣歡迎有您的加入! 也謝謝您為防疫盡一份心力!!!'
        end
    end

    def index

    end
end
