class DashboardsController < ApplicationController
    def index
      @orders = current_user.orders
      @hosts = current_user.organizations
      @host_events = @hosts.map{|host| host.events }.flatten

      new_events = Event.order(:created_at).last(5)
      hot_events = CheckIn.group(:event_id).count.to_a.sort_by { |event,times| times }.first(5).map do |event_info|
        Event.find(event_info[0])
      end
      
      @best_events = (new_events + hot_events).uniq
      
    end

    def show
      @user = current_user
      @order = Order.find(params[:id])
      @seats = @order.seats
      @event = @seats.map{|seat| seat.ticket.event }.uniq[0]
    end

    def new
      @user = current_user
      @contact = Contact.new
      @event = Event.find(params[:id])
    end

    def create
      @user = current_user
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
