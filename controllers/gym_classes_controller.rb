require_relative("../models/gym_class.rb")

get "/gym_classes" do
  @gym_classes = GymClass.all()
  erb (:"gym_classes/index")
end
