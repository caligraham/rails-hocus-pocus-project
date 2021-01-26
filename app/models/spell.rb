class Spell < ApplicationRecord

    belongs_to :spellbook
    has_many :users, through: :books

    validates :name, :description, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}

end
