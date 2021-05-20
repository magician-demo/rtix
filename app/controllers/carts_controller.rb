class CartsController < ApplicationController
  before_action :authenticate_user!
  helper_method :seat_status

  def show
    @seats = current_user.cart.seats
    @total_price = total_price
    # @event_id = current_user.cart.seats.first.ticket.event.id
    @current_cart = current_user.cart
    @event_all = Event.all
    
    @ticket_count = user_cart.seats.count
    
  end



  # 購物完清空購物車
  # def empty_cart
  #   redirect_to event_path(user_cart.seats.first.ticket.id)
  #   seats = user_cart.seats
  #   seats.update(statuㄈs: 'for_sale')
  #   seats.each do |s|
  #     s.ticket.amount += 1
  #     s.ticket.save
  #   end
  #   user_cart.line_items.destroy_all
  # end


  

  def checkout
    @order = Order.new
  end
  
  # 清空購物車的路徑
  def destroy
    current_user.cart.seats.each do |seat|
      seat.ticket.amount += 1
      seat.ticket.save
      seat.update(status: 'for_sale')
      seat.line_item.delete
    end
  end
end