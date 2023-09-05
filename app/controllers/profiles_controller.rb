class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user_or_fixer!, only: :show

  def show
    @user = current_user || current_fixer
  end

  private

  def authenticate_user_or_fixer!
    if user_signed_in?
      authenticate_user!
    elsif fixer_signed_in?
      authenticate_fixer!
    else
      redirect_to root_path
    end
  end
end
