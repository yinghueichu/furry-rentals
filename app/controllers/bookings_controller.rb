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
    if check_booking_conflict
      flash[:alert] = "Oups, the dates you select are no longer available."
      redirect_to show_available_animal_path(@animal)
    elsif @booking.save
      redirect_to bookings_path(@animal)
    else
      flash[:alert] = "The end date should be greater than start date."
      redirect_to show_available_animal_path(@animal)
    end
  end


  def check_booking_conflict
    @bookings = Booking.all.where(animal_id: @animal.id)
    check_results = []
    @bookings.each do |booking|
      if @booking.end_date <= booking.start_date || @booking.start_date >= booking.end_date
        check_result = "no conflict"
      else
        check_result = "conflict"
      end
      check_results << check_result
    end
    check_results.include?("conflict")
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
