class Spell < ApplicationRecord

    belongs_to :spellbook
    has_many :users, through: :books
end
