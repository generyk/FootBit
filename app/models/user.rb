class User < ApplicationRecord
  has_many :tryouts
  has_many :teams,through: :tryouts
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true 
end
