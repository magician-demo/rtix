class Seat < ApplicationRecord
  include AASM
  belongs_to :ticket
  has_one :line_item, :dependent => :destroy
  has_many :check_in
  has_many :order_items
  has_many :orders, through: :order_items
  after_update_commit { BookingStatusJob.perform_later(self) }

  aasm column: :status do
    state :for_sale, initial: true
    state :selected, :sold

    event :select do
      transitions from: :for_sale, to: :selected
    end

    event :sold do
      transitions from: :selected, to: :sold
    end

    event :return do
      transitions from: %i[selected sold], to: :for_sale
    end
  end
end
