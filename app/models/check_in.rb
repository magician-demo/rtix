class CheckIn < ApplicationRecord
  belongs_to :seat
  belongs_to :event
  include AASM

  aasm column: :status do
    state :pending, initial: true
    state :used

    event :use do
      transitions from: :pending, to: :used
    end
  end
end
