class Spellbook < ApplicationRecord

    has_many :spells
    has_many :users, through: :spells
    belongs_to :user
    


    validates :title, :category, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
    

    accepts_nested_attributes_for :spells, reject_if: :all_blank

end
