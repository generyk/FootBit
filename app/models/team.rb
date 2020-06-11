class Team < ApplicationRecord
  has_many :tryouts 
  has_many :users,through: :tryouts
end
