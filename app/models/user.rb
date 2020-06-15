class User < ApplicationRecord
  has_many :tryouts
  has_many :teams,through: :tryouts 


  has_secure_password
end
