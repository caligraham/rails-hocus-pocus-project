class User < ApplicationRecord
    has_secure_password

    has_many :spellbooks
    has_many :spells, through: :spellbooks
    has_one :crystal_ball

end
