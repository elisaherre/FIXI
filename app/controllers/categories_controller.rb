class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    all_fixers = Fixer.all
    @fixers = all_fixers.select do |fixer|
      fixer.categories.include?(@category)
    end
  end
end
