class Seat < ApplicationRecord
  belongs_to :ticket
  belongs_to :area
  belongs_to :location
end
