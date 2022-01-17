class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(booking.id)
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to animal_path(@booking.animal)
    else
      render new_review_path
    end

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
