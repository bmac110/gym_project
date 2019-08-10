require_relative("../models/gym_class.rb")

get "/gym_classes" do
  @gym_classes = GymClass.all()
  erb (:"gym_classes/index")
end

get "/gym_classes/:id" do
  @gym_classes = GymClass.find(params["id"].to_i())
  erb (:"gym_classes/show")
end
