# @bookings = []

# booking1 = Booking.new(start_date: (Date.today + 8), end_date: (Date.today + 9))
# booking2 = Booking.new(start_date: (Date.today + 4), end_date: (Date.today + 5))

# #@booking = Booking.new(start_date: Date.today, end_date: Date.today + 1)
# @booking = Booking.new(start_date: (Date.today + 4), end_date: (Date.today + 6))

# @bookings << booking1
# @bookings << booking2

# @bookings.count

# def check_booking_conflict_1
#     check_results = []
#     @bookings.each do |booking|
#       if @booking.end_date <= booking.start_date || @booking.start_date >= booking.end_date
#         check_result = "no_conflict"
#       else
#         check_result = "conflict"
#       end
#       check_results << check_result
#     end
#     p check_results
#   return "conflict" if check_results.include?("conflict")
# end

# def check_booking_conflict_2
#   p @booking
#   @bookings.any? do |booking|
#     @booking.end_date > booking.start_date && @booking.start_date > booking.end_date
#   end
# end

# p "method 1 : #{check_booking_conflict_1}"
# p "method 2 : #{check_booking_conflict_2}"

@animal = Animal.find(1)
@reviews = Review.all


reviews_by_animal = @reviews.select { |review| review.booking.animal == @animal }

ratings_by_animal = reviews_by_animal.map {|r| r.rating }

rating_average = ratings_by_animal.sum.fdiv(reviews_by_animal.count)

p rating_average
