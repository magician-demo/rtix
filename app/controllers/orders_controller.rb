require 'digest'

class OrdersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :return_url
  skip_before_action :authenticate_user!, only: :return_url
  # include  Cart

  def show
    @order =current_order
    @price = @order.totalAmount
    # @seats = user_cart.seats
    # current_order_id = Order.find(params[:id]).id
    @seats = @order.seats
    # @seats = OrderItem.find_by(order_id: current_order_id).seat
    # byebug
    # @serial = current_order.serial
    current_order.serial
    current_order.totalAmount
    current_order.checkMacValue
    @current_id = current_order.id
  end

  #抓綠界付款成功回傳值
  def return_url
    if params.require(:RtnCode)==1
      Order.find_by(serial: params[:MerchantTradeNo]).pay!
    else
      Order.find_by(serial: params[:MerchantTradeNo]).cancel!
      current_orders = Order.find_by(serial: params[:MerchantTradeNo])
      current_orders.seats.each do |seat|
        seat.update(status: 'for_sale')
      end
    end

  end

  #從綠界回網站
  def client_url
    
  end


  # 訂單成立清空購物車並將座位狀態改為sold
  def empty_cart
    current_user.cart.seats.each do |seat|
      seat.update(status: 'sold')
      OrderItem.create(order_id: current_user.id)
      # seat.order_item.save
      seat.line_item.delete
    end
  end
  

  def create
    @order = Order.new(user_id: current_user.id)
    @order.receiver = params.require(:order).permit(:receiver)
    @order.receiver = params.require(:order).permit(:tel)
  
    @ticket_number = current_user.cart.seats.count
    @event = current_user.cart.seats.first.ticket.event.title
    
    @order.item_list = [current_user.cart.seats]
    @order.totalAmount = total_price
    @order.serial

    #訂單與座位的第三方表格
    current_user.cart.seats.each do |seat|
      @order.order_items.new(
        seat_id: seat.id
      )
    end


    @order.save
    # OrderItem.create(params: params)

    # byebug
    #清空購物車
    empty_cart
    
    #檢查碼
    #回傳的網址
    # returnUrl = order_path(@order)
    
    beforeURLEncode = "HashKey=5294y06JbISpM5x9&ChoosePayment=Credit&EncryptType=1&ItemName=#{@order.serial}&MerchantID=2000132&MerchantTradeDate=#{Time.now.strftime('%Y/%m/%d %H:%M:%S')}&MerchantTradeNo=#{@order.serial}&PaymentType=aio&ReturnURL=https://949c2e887532.ngrok.io/orders/return_url/&TotalAmount=#{@order.totalAmount}&TradeDesc=Des&HashIV=v77hoKGq4kWxNNIS"

    query = URI.encode_www_form_component(beforeURLEncode).downcase
    dha = Digest::SHA256.hexdigest(query).upcase
    @order.checkMacValue = dha
    # p '==============dha'
    # p @order.checkMacValue
    # p '==============dha'
    
    #把檢查碼存進資料庫中
    @order.save
    
    # empty_cart!
    # @order.pay!
    
    redirect_to order_path(@order), notice: "謝謝"
  end

  
  
  def update
    #使用
    @order.use

    #過期
    @order.expire if Time.now > @event.date

    #退費
    @order.refund
  end
  
  
end

