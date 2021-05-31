class DashboardsController < ApplicationController
    def index
      # TODO: Remeebr to change to "current_user"
      @orders = User.find(1).orders

      
      # TODO: Remeber to change to current_user
      @hosts = User.find(1).organizations
      @host_events = @hosts.map{|host| host.events }.flatten
      @sorted_hosts = @host_events.sort{ 
        |a, b| [a[:s_year], a[:s_month], a[:s_date], a[:s_time]] <=> [b[:s_year], b[:s_month], b[:s_date], b[:s_time]] 
      }

      @best_events = Event.all.sample(12)
    end

    def show
      # TODO: Remeber to change to current_user
      @user = User.find(1)
      @order = Order.find(params[:id])
      @seats = @order.seats
      @event = @seats.map{|seat| seat.ticket.event }.uniq[0]
    end

    def new
        # TODO: Remeber to change to current_user
        @user = User.find(1)
        @contact = Contact.new
        @event = Event.find(params[:id])
    end

    def create
      # TODO: Remeber to change to current_user
      @user = User.find(1)
      @event = Event.find(params[:id])
      @contact = Contact.new(contact_params)
      
      if @contact.save
        ContactMailer.with(user: current_user, event: @event, contact: @contact).contact_created.deliver_later 
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
