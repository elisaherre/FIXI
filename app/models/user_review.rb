class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :fixer

  validates :rating, presence: true
  RATING = %w[1 2 3 4 5]
  validates :rating, inclusion: { in: RATING }
end
