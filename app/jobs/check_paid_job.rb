class CheckPaidJob < ApplicationJob
  queue_as :default

  def perform(order)
    if order.status == 'pending'
      order.cancel!
    end
  end
end
