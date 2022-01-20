
class Period
  def initialize(start_date, end_date)
    @start_date = start
    @end_date = end_date
  end

end

puts Period.new(Date.today, (Date.today + 1))

# def check_booking_conflict
#     @bookings = Booking.all
#     check_results = []
#     @bookings.each do |booking|
#       if @booking.end_date > booking.start_date && @booking.start_date > booking.end_date
#         check_result = true
#       else
#         check_result = false
#       end
#       check_results << check_result
#     end
#   check_results.include?(false)
# end
