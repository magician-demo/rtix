class Contact < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :feedback, presence: true
end
