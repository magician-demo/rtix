class Ticket < ApplicationRecord
  belongs_to :event
  has_many :seats, :dependent => :destroy

  validates :name, presence: true
end
