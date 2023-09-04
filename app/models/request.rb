class Request < ApplicationRecord
  belongs_to :user
  belongs_to :fixer
  has_many :payments

  validates :fixer, presence: true
  validates :user, presence: true
  validates :description, presence: true
end
