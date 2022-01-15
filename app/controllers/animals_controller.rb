class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :root]
  before_action :set_animal, only: [:show, :edit, :update]

  def index
    @animals= Animal.where.not(latitude: nil, longitude:nil)
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
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

  def edit
  end

  def update
    @animal.update(strong_params)

    redirect_to animal_path(@animal)
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def strong_params
    params.require(:animal).permit(:name, :species, :address, :description, :available, :photo)
  end
end
