class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :check_ins
  belongs_to :organization
  mount_uploader :image, ImageUploader
  mount_uploader :seats_image, ImageUploader

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :address, presence: true
  validates :description, presence: true

  geocoded_by :address #分析並紀錄 由geocoder
  after_validation :geocode, if: :address_changed? #選配，如果資料不會修改就不用

  scope :available, -> {
    where(status: '已發佈')
    .order('start_time desc')
    .where("start_time > ?", Time.now)
  }

  #能edit地址，
  # def address_changed?
  #   address_changed?
  # end

  # aasm column: 'status', no_direct_assignment: true do
  #   state :pending, initial: true
  #   state :published, :cancel

  #   event :publishe do
  #     transitions from: :pending, to: :published
  #   end
  # end
end
