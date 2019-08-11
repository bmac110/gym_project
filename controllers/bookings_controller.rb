require_relative("../models/booking.rb")

get "/bookings" do
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get "/bookings/new" do
  @bookings = Booking.all()
  erb(:"bookings/new")
end
