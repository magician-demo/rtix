class Event < ApplicationRecord
  has_many :tickets
  belongs_to :organization
end
