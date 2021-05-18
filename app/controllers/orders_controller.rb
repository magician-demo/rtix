require 'digest'

class OrdersController < ApplicationController
  before_action :authenticate_user!
  # include  Cart

  def show
    # @order = Order.find(params[:id])
    @price = total_price
    @seats = user_cart.seats
    # byebug
    # @serial = current_order.serial
    current_order.serial
    current_order.totalAmount
    current_order.checkMacValue
    @current_id = current_order.id
  end


  
  

  def create
    @order = Order.new(user_id: current_user.id)
    # @order = current_user.Orders.new(order_params)
    @ticket_number = current_user.cart.seats.count
    @event = current_user.cart.seats.first.ticket.event.title
    # current_user.cart.seats.each do |s|
    #   @order.order_items.new(
    #     seat_id: current_user.cart.seats[s].id, 
    #     quantity: current_user.cart.seats.count
    #   )
    #   price = current_user.cart.seats[s].ticket.price
    # end
    @order.item_list = [current_user.cart.seats]
    @order.totalAmount = total_price
    @order.serial
    
    #每筆訂單明細
    # returnUrl = order_path(@order)
    
    beforeURLEncode = "HashKey=5294y06JbISpM5x9&ChoosePayment=Credit&EncryptType=1&ItemName=#{@order.serial}&MerchantID=2000132&MerchantTradeDate=#{Time.now.strftime('%Y/%m/%d %H:%M:%S')}&MerchantTradeNo=#{@order.serial}&PaymentType=aio&ReturnURL=https://d71c50775a63.ngrok.io/&TotalAmount=#{@order.totalAmount}&TradeDesc=Des&HashIV=v77hoKGq4kWxNNIS"
    
    query = URI.encode_www_form_component(beforeURLEncode).downcase
    dha = Digest::SHA256.hexdigest(query).upcase
    @order.checkMacValue = dha
    @order.save
    
    # empty_cart!
    # @order.pay!
    
    redirect_to order_path(@order), notice: "謝謝"
  end
  
  def update
    #付款
    @order.pay!

    #使用
    @order.use

    #過期
    @order.expire if Time.now > @event.date

    #取消
    @order.cancel

    #退費
    @order.refund

  end
  
  private 
    def order_params
      params.require(:order).permit(:receiver, :tel)
    end
end

