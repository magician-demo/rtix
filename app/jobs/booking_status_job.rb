class BookingStatusJob < ApplicationJob
  queue_as :default
  def perform(seat)
    ActionCable.server.broadcast "BookingStatusChannel_#{seat.ticket.id}",{message: 'changed!', id: seat.id}
  end
end
