class SeatStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "SeatStatusChannel:#{params[:seat_id]}"
  end
end