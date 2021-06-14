class CheckPaidJob < ApplicationJob
  queue_as :default

  def perform(order)
    order.cancel! if order.status == 'pending'
  end
end
