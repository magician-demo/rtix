class Seat < ApplicationRecord
  belongs_to :ticket
  has_one :line_item
  after_commit :broadcast_me
  def broadcast_me
    ActionCable.server.broadcast "BookingStatusChannel_#{ticket.id}",{message: 'changed!', id: id}
  end
end
