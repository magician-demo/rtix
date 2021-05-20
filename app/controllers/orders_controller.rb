require 'digest'

class OrdersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :return_url
  skip_before_action :authenticate_user!, only: :return_url
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

  #抓綠界付款成功回傳值
  def return_url
    Order.find_by(serial: params[:MerchantTradeNo]).pay!
  end


  # 訂單成立清空購物車並將座位狀態改為sold
  def empty_cart
    current_user.cart.seats.each do |seat|
      seat.update(status: 'sold')
      seat.line_item.delete
    end
  end
  

  def create
    @order = Order.new(user_id: current_user.id)
    # @order = current_user.Orders.new(order_params)
    @ticket_number = current_user.cart.seats.count
    @event = current_user.cart.seats.first.ticket.event.title
    
    @order.item_list = [current_user.cart.seats]
    @order.totalAmount = total_price
    @order.serial
    @order.save

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

