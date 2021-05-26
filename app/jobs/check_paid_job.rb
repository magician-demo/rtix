class CheckPaidJob < ApplicationJob
  queue_as :default

  def perform(order)
    if order.created_at <= 10.minutes.ago && order.status == 'pending'
      order.cancel!
    end
  end

end
