class Event < ApplicationRecord
  has_many :tickets, :dependent => :destroy
  belongs_to :organization
  

  # aasm column: 'status', no_direct_assignment: true do
  #   state :pending, initial: true
  #   state :published, :cancel

  #   event :publishe do
  #     transitions from: :pending, to: :published
  #   end
  # end
end
