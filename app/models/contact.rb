class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /.+\@.+\..+/ }
  validates :tel, presence: true
  validates :event, presence: true
  validates :title, presence: true
  validates :feedback, presence: true
end
