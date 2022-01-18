class BookingsController < ApplicationController


  def index
    @bookings = Booking.all.order(created_at: :desc)
    @user_bookings = Booking.where(user: current_user).order(created_at: :desc)
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@animal)
    else
      render 'animals/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
