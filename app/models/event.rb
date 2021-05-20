class Event < ApplicationRecord
    
    has_many :users, through: :tickets
    belongs_to :organization

    broadcasts_to ->(event) {'events'}, target: :events
    has_many :tickets
end
