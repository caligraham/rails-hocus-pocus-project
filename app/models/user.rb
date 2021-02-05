class User < ApplicationRecord
    has_secure_password

    has_many :spells
    has_many :spellbooks, through: :spells
    
    has_one :crystal_ball

    validates :username, :email, presence: true, uniqueness: true
    
end
