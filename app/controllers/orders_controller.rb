require 'digest'

class OrdersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :return_url
  skip_before_action :authenticate_user!, only: :return_url

  def show
    @price = current_order.totalAmount
    @seats = current_order.seats
    @current_id = current_order.id
  end

  #抓綠界付款成功回傳值
  def return_url
    ecpay_order = Order.find_by(serial: params[:MerchantTradeNo])
    params[:RtnCode] == '1' ? ecpay_order.pay! : ecpay_order.cancel!
  end

  #從綠界回網站
  def client_url; end

  def create
    @order = current_user.orders.new(order_params)

    @ticket_number = current_cart.seats.count
    @event = current_cart.seats.first.ticket.event.title

    @order.item_list = [current_cart.seats]
    @order.totalAmount = current_cart.total_price
    @order.serial

    #訂單與座位的第三方表格
    current_user.cart.seats.each do |seat| 
      @order.order_items.new(seat_id: seat.id) 
      seat.check_in.create
    end

    #訂單成立、先產生訂單序號跟總金額到欄位中，讓下面的檢查碼抓取
    @order.save

    #清空購物車
    empty_cart!

    #檢查碼
    #回傳的網址:導回首頁
    # ClientBackURL=https://949c2e887532.ngrok.io/&

    # beforeURLEncode =
    #   "HashKey=#{ENV['hash_key']}&ChoosePayment=Credit&ClientBackURL=#{ENV['server']}/&EncryptType=1&ItemName=#{@order.serial}&MerchantID=#{ENV['merchant_id']}&MerchantTradeDate=#{Time.now.strftime('%Y/%m/%d %H:%M:%S')}&MerchantTradeNo=#{@order.serial}&PaymentType=aio&ReturnURL=#{ENV['server']}/orders/return_url/&TotalAmount=#{@order.totalAmount}&TradeDesc=Des&HashIV=#{ENV['hash_iv']}"

    beforeURLEncode = "HashKey=#{ENV["hash_key"]}&ChoosePayment=Credit&ClientBackURL=#{ENV["server"]}/&EncryptType=1&ItemName=#{@order.serial}&MerchantID=#{ENV["merchant_id"]}&MerchantTradeDate=#{Time.now.strftime('%Y/%m/%d %H:%M:%S')}&MerchantTradeNo=#{@order.serial}&PaymentType=aio&ReturnURL=#{ENV["server"]}/orders/return_url/&TotalAmount=#{@order.totalAmount}&TradeDesc=Des&HashIV=#{ENV["hash_iv"]}"

    query = URI.encode_www_form_component(beforeURLEncode).downcase
    @order.checkMacValue = Digest::SHA256.hexdigest(query).upcase
    
    #把檢查碼存進資料庫中
    @order.save

    #10分鐘後檢查是否付款
    CheckPaidJob.set(wait: 10.minutes).perform_later(@order)

    redirect_to order_path(@order), notice: '謝謝'
  end

  def update
    #使用
    @order.use

    #過期
    @order.expire if Time.now > @event.date

    #退費
    @order.refund
  end

  private

  def empty_cart!
    current_cart.seats.each do |seat|
      seat.sold!
      seat.line_item.destroy
      OrderItem.create(order_id: current_user.id)
      ActionCable.server.broadcast "BookingStatusChannel_#{seat.ticket.id}",
                                   { message: 'sold!', id: seat.id }
    end
  end

  def order_params
    params.require(:order).permit(:receiver, :tel)
  end
end
