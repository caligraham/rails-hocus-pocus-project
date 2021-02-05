class Spell < ApplicationRecord

    belongs_to :spellbook
    belongs_to :user



    validates :name, :description, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}

    accepts_nested_attributes_for :spellbook, reject_if: :all_blank

    def self.newest_spells
        Spell.order(created_at: :desc).limit(5)
    end

end
