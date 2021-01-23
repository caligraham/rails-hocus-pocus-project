class Spellbook < ApplicationRecord

    has_many :spells
    belongs_to :user

end
