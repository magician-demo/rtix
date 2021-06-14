class DashboardsController < ApplicationController
  before_action :find_event, only: [:new, :create]

  def index
    @orders = current_user.orders.where(status: "paid").or(current_user.orders.where(status: "pending"))
    @hosts = current_user.organizations.includes(:events)
    @host_events = @hosts.map { |host| host.events }.flatten

    new_events = Event.order(created_at: :desc).limit(5)
    hot_events = Event.left_joins(:check_ins).group(:id).order("COUNT(check_ins.id) DESC").first(5)

    @best_events = (new_events + hot_events).uniq
  end

  def show
    @order = Order.find(params[:id])
    @seats = @order.seats.includes(:ticket)
    @event = @seats.map { |seat| seat.ticket.event }.uniq[0]
  end

  def new
    @user = current_user
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      ContactMailer
        .with(user: current_user, event: @event, contact: @contact)
        .contact_created
        .deliver_later
      redirect_to dashboards_path,
                  notice: '感謝您的意見反饋!活動舉辦方將會盡快回應您!'
    else
      render :new
    end
  end

  private
  def find_event 
    @event = Event.find(params[:id])
  end

  def contact_params
    params
      .require(:contact)
      .permit(:name, :email, :tel, :event, :title, :feedback)
  end
end
