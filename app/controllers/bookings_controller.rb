class BookingsController < ApplicationController
  scope :having_dob_between, ->(start_date, end_date) { where(dob: start_date..end_date) }

  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
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
