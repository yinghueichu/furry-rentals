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
    # raise
    if check_booking_conflict
      if @booking.save
        redirect_to bookings_path(@animal)
      else
        flash.now[:alert] = "The end date should be greater than start date."
      end
    else
      flash.now[:alert] = "Oups, the dates you select are no longer available."
    end
  end

  def check_booking_conflict
    @bookings = Booking.all
    check_results = []
    @bookings.each do |booking|
      if @booking.end_date > booking.start_date && @booking.start_date > booking.end_date
        check_result = true
      else
        check_result = false
      end
      check_results << check_result
    end
    check_results.include?(false)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
