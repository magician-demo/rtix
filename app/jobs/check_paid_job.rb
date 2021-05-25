class CheckPaidJob < ApplicationJob
  queue_as :default

  def perform(order)
    if order.status == "pending"
      order.cancel!
      order.seats.each do |seat|
        seat.update(status: "for_sale")
      end
    end
    order.save
  end
end
