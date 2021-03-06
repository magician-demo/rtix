class Order < ApplicationRecord
  belongs_to :user
  include AASM
  has_many :order_items
  has_many :seats, through: :order_items

  validates :serial, uniqueness: true
  before_create :create_serial

  aasm column: 'status', no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :used, :expired, :cancelled, :refunded

    event :pay do
      transitions from: %i[pending used], to: :paid
    end

    event :use do
      transitions from: :paid, to: :used
    end

    event :expire do
      transitions from: :paid, to: :expired
    end

    event :cancel do
      transitions from: %i[pending paid], to: :cancelled, after: :reorg
    end

    event :refund do
      transitions from: [:cancelled], to: :refunded
    end
  end

  private

  def random_serials(n)
    [*'a'..'z', *'0'..'9'].sample(n).join
  end

  def create_serial
    self.serial = serial_generator(random_serials(8))
  end

  def serial_generator(n)
    Time.now.strftime("%Y%m%d#{n}")
  end

  def reorg
    self.seats.each do |seat|
      seat.return!
      seat.ticket.amount += 1
      seat.ticket.save
      CheckIn.find_by(seat_id: seat.id).destroy
    end
  end
end
