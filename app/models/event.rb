class Event < ApplicationRecord
  has_many :tickets
  belongs_to :organization
  mount_uploader :image, ImageUploader


  # aasm column: 'status', no_direct_assignment: true do
  #   state :pending, initial: true
  #   state :published, :cancel

  #   event :publishe do
  #     transitions from: :pending, to: :published
  #   end
  # end
end
