class BookingsController < ApplicationController

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    if @booking.save
      redirect_to animal_path(@animal)
    else
      render 'animals/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
