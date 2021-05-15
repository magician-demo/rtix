class Organization < ApplicationRecord
  acts_as_paranoid #Soft Delete

  validates :title, presence: true, 
                    uniqueness: true

  belongs_to :user
end
