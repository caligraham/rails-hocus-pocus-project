class Spellbook < ApplicationRecord

    has_many :spells
    belongs_to :user


    validates :title, :category, presence: true
    validates :level, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}

    accepts_nested_attributes_for :spells, reject_if: proc { |attributes| attributes['name'].blank? || attributes['description'].blank? || attributes['laccepts_nested_attributes_for :spells, reject_if: proc { |attributes| attributes['name'].blank? || attributes['description'].blank? || attributes['difficulty_level'].blank? || attributes['power_level'].blank?  }evel'].blank?  }

end
