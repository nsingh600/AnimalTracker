class SpeciesController < ApplicationController
  def index
    @categories = Category.all
    @species = Species.includes(:category)

    # Simple Search & Category Filter (4.1 & 4.2)
    if params[:query].present?
      @species = @species.where("name LIKE ? OR scientific_name LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:category_id].present?
      @species = @species.where(category_id: params[:category_id])
    end

    # Pagination (3.5)
    @species = @species.page(params[:page]).per(12)
  end

  def show
    @species = Species.find(params[:id])
  end
end
