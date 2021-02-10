class Spellbook < ApplicationRecord

    has_many :spells
    has_many :users, through: :spells
    
    


    validates :title, :category, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
    

    def self.newest_spellbooks
        Spellbook.order(created_at: :desc).limit(5)
    end

end
