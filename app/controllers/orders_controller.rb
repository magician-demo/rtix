require 'digest'

class OrdersController < ApplicationController
  before_action :authenticate_user!
  # include  Cart

  def show
    # @order = Order.find(params[:id])
    @price = total_price
    @area = seats_area
    
  end

  def seats_area
    seats = user_cart.seats
    seats.each do |s|
      s.find(params[:id])
    end
  end
  
  

  def create
    @order = Order.new(user_id: current_user.id)
    # @order = current_user.Orders.new(order_params)
   
    current_user.cart.line_items.each do |item|
      @order.order_items.new(
        seat_id: current_user.cart.seat.id, 
        quantity: current_user.cart.seats.count
      )
      price = total_price
    end
    @order.totalAmount = price
    @order.serial
    @order.save

    #每筆訂單明細
    returnUrl = order_path(@order)

    beforeURLEncode = "HashKey=5294y06JbISpM5x9&ChoosePayment=Credit&EncryptType=1&ItemName=#{@order.serial}&MerchantID=2000132&MerchantTradeDate=#{Time.now.strftime('%Y/%m/%d %H:%M:%S')}&MerchantTradeNo=#{@order.serial}&PaymentType=aio&ReturnURL=https://7aad07be40bb.ngrok.io/&TotalAmount=#{@order.totalAmount}&TradeDesc=Des&HashIV=v77hoKGq4kWxNNIS"

    query = URI.encode_www_form_component(beforeURLEncode).downcase
    dha = Digest::SHA256.hexdigest(query).upcase
    @order.checkMacValue = dha

    # empty_cart!
    @order.pay!

    redirect_to order_path(@order), notice: "謝謝"
  end

  def update
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

