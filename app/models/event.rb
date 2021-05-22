class Event < ApplicationRecord
    has_many :tickets
    belongs_to :organization
    broadcasts_to ->(event) {'events'}, target: :events
end
