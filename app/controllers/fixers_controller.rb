class FixersController < ApplicationController
  def show
    @fixer = Fixer.find(params[:id])
  end
end
