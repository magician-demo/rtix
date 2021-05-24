require 'sidekiq-scheduler'

class CheckEveryPaidJob < ApplicationJob
  # include Sidekiq::Worker

  def perform
    # puts "job"
    byebug
    Order.all.each do |order|
      if order.status == "pending"
        byebug
        order.cancel!
        order.seats.each do |seat|
          seat.update(status: "for_sale")
        end
      end
      order.save
    end

  end
end