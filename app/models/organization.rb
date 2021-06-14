class Organization < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :domain_name, use: :slugged

  mount_uploader :image, ImageUploader

  validates :title, presence: true, uniqueness: true
  validates :domain_name,
            presence: true,
            uniqueness: true,
            length: {
              in: 3..16,
            },
            format: {
              with: /\A[a-z0-9]+\z/,
            }
  validates :e_mail, presence: true
  belongs_to :user
  has_many :events

  def should_generate_new_friendly_id?
    domain_name_changed?
  end
end
