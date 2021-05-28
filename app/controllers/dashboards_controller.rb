class DashboardsController < ApplicationController
  def index
    @user = current_user
    @user_seats = @user.orders.map { |order| order.seats }.flatten
    @user_events = @user_seats.map { |seat| seat.ticket.event }.uniq
    @sorted_events =
      @user_events.sort do |a, b|
        [a[:s_year], a[:s_month], a[:s_date], a[:s_time]] <=> [
          b[:s_year],
          b[:s_month],
          b[:s_date],
          b[:s_time],
        ]
      end

    @hosts = @user.organizations
    @host_events = @hosts.map { |host| host.events }.flatten
    @sorted_hosts =
      @host_events.sort do |a, b|
        [a[:s_year], a[:s_month], a[:s_date], a[:s_time]] <=> [
          b[:s_year],
          b[:s_month],
          b[:s_date],
          b[:s_time],
        ]
      end

    @best_events = Event.all.sample(12)
    # 張凱強加上去的根據 order 做正確的查詢
    @user_seats_count = current_user.orders.where(status: 'paid').reduce(0) { |sum, order| sum + order.order_items.count}
  end

  def show
    @user = current_user
    @user_seats = @user.orders.map { |order| order.seats }.flatten
    @user_events = @user_seats.map { |seat| seat.ticket.event }.uniq
    @this_event =
      @user_events.select { |event| (event.id) == (params[:id].to_i) }[0]
    
    # 張凱強加上去的根據 order 做正確的查詢
    @user_seats_count = current_user.orders.where(status: 'paid').reduce(0) { |sum, order| sum + order.order_items.count}
    @user_orders_total_amount = current_user.orders.where(status: 'paid').reduce(0) { |sum, order| sum + order.totalAmount}
    @user_ticket = current_user.orders.where(status: 'paid')
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
      redirect_to dashboards_path,
                  notice: '感謝您的意見反饋!活動舉辦方將會盡快回應您!'
    else
      render :new
    end
  end

  private

  def contact_params
    params
      .require(:contact)
      .permit(:name, :email, :tel, :event, :title, :feedback, :user_id)
  end
end
