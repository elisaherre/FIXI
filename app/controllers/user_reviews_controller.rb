class UserReviewsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_fixer!

  def new
    @user_review = UserReview.new
  end

  def create
    @user_review = UserReview.new(user_review_params)
    @user_review.user = current_fixer
    if @user_review.save
      redirect_to users_reviews_path(@user_review)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
