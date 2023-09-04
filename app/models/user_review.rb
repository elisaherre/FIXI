class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :fixer

  validates :rating, presence: true
  validates :user, presence: true
  validates :fixer, presence: true
end
