class Team < ApplicationRecord
  has_many :tryouts
  has_many :users,through: :tryouts

  validates :name, :location, presence: true 

  scope :alpha, -> { order(:name)}
end
