class AnimalsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show, :index, :root]
  before_action :set_animal, only: [:show, :edit, :update, :show_available]

  def index
    @animals= Animal.where.not(latitude: nil, longitude:nil)
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { animal: animal })
      }
    end

    if params[:query].present?
      sql_query = "name ILIKE :query OR species ILIKE :query"
      @animals = Animal.where(sql_query, query: "%#{params[:query]}%")
    else
      @animals = Animal.all
    end
  end

  def my_animals
    @animals = Animal.where(user_id: current_user)
  end

  def show
    @booking = Booking.new
    @markers = [
     {
        lat: @animal.latitude,
        lng: @animal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { animal: @animal })
      }]
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

  def show_available
    @booking = Booking.new
  end

  def available?(from, to)
    bookings.where('start_date <= ? AND end_date >= ?', to, from).none?
  end


  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def strong_params
    params.require(:animal).permit(:name, :species, :address, :description, :available, :photo)
  end
end
