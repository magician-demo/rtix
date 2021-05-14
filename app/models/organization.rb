class Organization < ApplicationRecord
  acts_as_paranoid #Soft Delete
  belongs_to :user
end
