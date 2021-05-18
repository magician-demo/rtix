class Event < ApplicationRecord
    has_many :tickets 
    has_many :users, through: :tickets
    belongs_to :organization

    broadcasts_to ->(event) {'events'}, target: :events
end
