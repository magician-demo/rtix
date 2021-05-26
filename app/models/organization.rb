class Organization < ApplicationRecord
  acts_as_paranoid

  validates :title, presence: true, uniqueness: true
  belongs_to :user
  has_many :events
end
