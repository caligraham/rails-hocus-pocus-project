class Spellbook < ApplicationRecord

    has_many :spells
    belongs_to :user


    validates :title, :category, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}

    accepts_nested_attributes_for :spells, reject_if: proc { |attributes| attributes['name'].blank? || attributes['category'].blank? || attributes['level'].blank?  }

end
