class Event < ApplicationRecord
    has_many :tickets 
    has_many :users, through: :tickets

    broadcasts_to ->(event) {'events'}, target: :events
end
