class Contact < ApplicationRecord
  validates :title, presence: true
  validates :feedback, presence: true
end
