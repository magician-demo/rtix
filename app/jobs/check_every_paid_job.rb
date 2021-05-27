require 'sidekiq-scheduler'
class CheckEveryPaidJob < ApplicationJob
  def perform
    Order
      .where('created_at <= ?', 30.minutes.ago)
      .each { |order| order.cancel! if order.status == 'pending' }
  end
end
