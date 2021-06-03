class Event < ApplicationRecord
  has_many :tickets, :dependent => :destroy
  belongs_to :organization
  mount_uploader :image, ImageUploader
  mount_uploader :seats_image, ImageUploader

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :address, presence: true
  validates :description, presence: true

  
  # aasm column: 'status', no_direct_assignment: true do
  #   state :pending, initial: true
  #   state :published, :cancel

  #   event :publishe do
  #     transitions from: :pending, to: :published
  #   end
  # end
end
