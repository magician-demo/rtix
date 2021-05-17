class Organization < ApplicationRecord
  acts_as_paranoid # Soft Delete
  # friendly_id
  extend FriendlyId
  friendly_id :domain_name, use: :slugged

  def should_generate_new_friendly_id?
    domain_name_changed?
  end

  validates :title, presence: true, 
                    uniqueness: true
  validates :domain_name, presence: true, 
                          uniqueness: true,
                          length: { in: 3..16 },
                          format: { with: /\A[a-z0-9]+\z/ }
  belongs_to :user
end
