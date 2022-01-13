class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :root]

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @booking = Booking.new
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(strong_params)
    @animal.user = @animal
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:animal).permit(:name, :species, :address)
  end
end
