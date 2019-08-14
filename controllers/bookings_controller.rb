require_relative("../models/booking.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/member.rb")

get "/bookings" do
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get "/bookings/new" do
  @members = Member.all()
  @gym_classes = GymClass.all()
  @bookings = Booking.all()
  erb(:"bookings/new")
end

get "/bookings/:id" do
  @booking = Booking.find(params["id"].to_i())
  erb(:"bookings/show")
end

post "/bookings/:id/delete" do
  booking = Booking.find(params["id"])
  booking.delete()
  redirect to("/bookings")
end


post "/bookings" do
  Booking.new(params).save()
  redirect to("/bookings")
end
