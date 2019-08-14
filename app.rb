require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/members_controller.rb")
require_relative("controllers/gym_classes_controller.rb")
require_relative("controllers/bookings_controller.rb")
require_relative("./models/member.rb")
require_relative("./models/gym_class.rb")
require_relative("./models/booking.rb")
also_reload("./models/*")

get "/" do
  @members = Member.all()
  @gym_classes = GymClass.all()
  @bookings = Booking.all()
  erb (:index)
end
