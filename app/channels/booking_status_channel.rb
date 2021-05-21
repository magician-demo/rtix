class BookingStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "BookingStatusChannel_#{params[:booking_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
