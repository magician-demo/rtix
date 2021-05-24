class Seat < ApplicationRecord
  belongs_to :ticket
  has_one :line_item
  after_update_commit { BookingStatusJob.perform_later(self) }
end
