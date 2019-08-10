require_relative("../models/booking.rb")

get "/bookings" do
  @bookings = Booking.all()
  erb(:"bookings/index")
end
