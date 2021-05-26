require 'sidekiq-scheduler'
class CheckEveryPaidJob < ApplicationJob
  def perform
    Order.where('created_at <= ?', 30.minutes.ago).each do |order|
      if order.status == 'pending'
        order.cancel!
      end
    end
  end

end
