class HabitatsController < ApplicationController
  def index
    @habitats = Habitat.all
  end

  def show
    @habitat = Habitat.find(params[:id])
  end
end
