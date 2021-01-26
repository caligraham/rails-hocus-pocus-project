class Spell < ApplicationRecord

    belongs_to :spellbook
    has_many :users, through: :books

    def spellbook_attributes=(hash_of_attributes)
        if !hash_of_attributes[:title].blank? && !hash_of_attributes[:category].blank? && !hash_of_attributes[:level].blank?
            self.spellbook = Spellbook.find_or_create_by(hash_of_attributes)
        end
    end

    validates :name, :description, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}

end
