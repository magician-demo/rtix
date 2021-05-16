class SeatStatusChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.info "Subscribed to #{params[:seat_id]}"

    stream_from "SeatStatusChannel:#{params[:seat_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end