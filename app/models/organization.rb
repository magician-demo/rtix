class Organization < ApplicationRecord
  acts_as_paranoid # Soft Delete
  
  extend FriendlyId # friendly_id
  friendly_id :domain_name, use: :slugged

  def should_generate_new_friendly_id?
    domain_name_changed?
  end

  mount_uploader :image, ImageUploader # 圖片上傳

  validates :title, presence: true, 
                    uniqueness: true
  validates :domain_name, presence: true, 
                          uniqueness: true,
                          length: { in: 3..16 },
                          format: { with: /\A[a-z0-9]+\z/ }
  belongs_to :user
end
