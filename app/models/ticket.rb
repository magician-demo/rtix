class Ticket < ApplicationRecord
  belongs_to :event
  has_many :seats
end
