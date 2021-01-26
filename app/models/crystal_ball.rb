class CrystalBall < ApplicationRecord
  belongs_to :user

  validates :type, :size, presence: true
  
  validates :sorcery_score, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 1000}
end
