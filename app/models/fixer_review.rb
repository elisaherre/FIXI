class FixerReview < ApplicationRecord
  belongs_to :user
  belongs_to :fixer

  validates :rating, presence: true
end
