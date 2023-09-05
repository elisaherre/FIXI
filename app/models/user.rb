class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :fixer_reviews
  has_many :user_reviews, dependent: :destroy
  has_many :requests

  validates :name, presence: true
  validates :address, presence: true

  has_one_attached :photo
end
