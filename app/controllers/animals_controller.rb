class AnimalsController < ApplicationController

  def index
    @animals= Animal.all
  end

  def new
    @animal= Animal.new
  end

  def create
    @animal = Animal.new(strong_params)
    raise
    @animal.user = current_user
    if @animal.save!
      raise
      redirect_to animals_path
    else
      render :new
    end
  end

  private
  def strong_params
    params.require(:animal).permit(:name, :species, :address, :description, :available)
  end
end
