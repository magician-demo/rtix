require 'sidekiq-scheduler'

class CheckEveryPaidJob < ApplicationJob
  include Sidekiq::Worker

  def perform
    puts "job"
    # Order.all.each do |order|
    #   if order.status == "pending"
    #     order.cancel!
    #     order.seats.each do |seat|
    #       seat.update(status: "for_sale")
    #     end
    #   end
    #   order.save
    # end

  end
end