class DashboardsController < ApplicationController
    def index
        @user = User.find(2)
        @user_seats = @user.orders.map {|order| order.seats }.flatten
        @user_events = @user_seats.map {|seat| seat.ticket.event }.uniq
        @sorted_events = @user_events.sort{ 
          |a, b| [a[:s_year], a[:s_month], a[:s_date], a[:s_time]] <=> [b[:s_year], b[:s_month], b[:s_date], b[:s_time]] 
        }


        @hosts = @user.organizations
        @host_events = @hosts.map{|host| host.events }.flatten
        @sorted_hosts = @host_events.sort{ 
          |a, b| [a[:s_year], a[:s_month], a[:s_date], a[:s_time]] <=> [b[:s_year], b[:s_month], b[:s_date], b[:s_time]] 
        }

        @best_events = Event.all.sample(12)
    end

    def show
      @user = User.find(2)
      @user_seats = @user.orders.map {|order| order.seats }.flatten
      @user_events = @user_seats.map {|seat| seat.ticket.event }.uniq
      @this_event = @user_events.select {|event| (event.id) == (params[:id].to_i)}[0]
      
    end

    def new
        @user = User.find(2)
        @contact = Contact.new
        @event = Event.find(params[:id])
    end

    def create
        @user = User.find(2)
        @event = Event.find(params[:id])
        @contact = Contact.new(contact_params)
        if @contact.save 
          redirect_to dashboards_path, notice: "感謝您的意見反饋!活動舉辦方將會盡快回應您!"
        else
          render :new 
        end
    end

    private 
    def contact_params
      params.require(:contact).permit(:name, :email, :tel, :event, :title, :feedback, :user_id)
    end

end