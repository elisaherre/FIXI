class Category < ApplicationRecord
  has_many :fixers, through: :fixer_category

  validates :name, presence: true
end
