class User < ApplicationRecord

  attr_accessor :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organizations
  has_many :tickets
  has_many :events, through: :tickets 
end
