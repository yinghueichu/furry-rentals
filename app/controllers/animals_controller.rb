class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :root]

  def index

    @animals= Animal.all
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
    @animal.user = current_user
    if @animal.save!
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
