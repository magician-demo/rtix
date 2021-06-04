class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    # 建立一個 line_item 加入座位
    seat = Seat.where(status: 'for_sale').find(params[:seat_id])
    ticket = seat.ticket
    line_item = current_cart.line_items.new(seat_id: params[:seat_id])
    if line_item.save
      render json: {
               name: seat.ticket.name,
               area: seat.area,
               id: seat.id,
               price: seat.ticket.price,
               itemId: line_item.id,
               total_price: current_cart.total_price
             }
    else
      render json: { status: 'error' }
    end
  end

  def destroy
    # 刪除一個line_item 並恢復座位狀態及票券數量調整
    line_item = LineItem.find(params[:id])
    seat = line_item.seat
    ticket = seat.ticket
    if line_item.destroy
      render json: { total_price: current_cart.total_price }
    else
      render json: { status: 'error' }
    end
  end

  def ticket_list
    @ticket_id_array = []
    current_cart.seats.each do |seat|
      @ticket_id_array << seat.ticket.id
    end
    render json: @ticket_id_array.sort.uniq
  end

  def random_create
    # params[:ticketCount] 為前端表格回傳的資料結構為一個 hash 內有陣列 (根據票種數量而定)
    params[:ticketCount].each do |per_ticket|
      # 找出還能被選擇的座位
      for_sale_ticket =
        Ticket.find(per_ticket[0].to_i).seats.where(status: 'for_sale')
      # 找出座位的中位數
      num = (for_sale_ticket.ids.count / 2).ceil

      # 將座位的 id 排列成一個陣列，以供後面找位置使用
      id_array = for_sale_ticket.ids.sort

      # 針對每一種票券客人點擊的數量來做運算，從中位數開始分配鄰近座位，順帶改變票券以及座位狀態。
      per_ticket[1].to_i.times do
        seat = for_sale_ticket.find(id_array[num])
        ticket = Ticket.find(per_ticket[0].to_i)
        line_item = current_cart.line_items.new(seat_id: seat.id)
        line_item.save
        num += 1
      end
    end
  end
end
