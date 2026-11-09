class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @species = @category.species.page(params[:page]).per(10)
  end
end