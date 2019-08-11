require_relative("../models/gym_class.rb")

get "/gym_classes" do
  @gym_classes = GymClass.all()
  erb (:"gym_classes/index")
end

get "/gym_classes/new" do
  @gym_classes = GymClass.all()
  erb(:"gym_classes/new")
end

get "/gym_classes/:id" do
  @gym_class = GymClass.find(params["id"].to_i()) #could be @gym_class
  erb (:"gym_classes/show")
end

post "/gym_classes" do
  GymClass.new(params).save()
  redirect to("/gym_classes")
end

post "/gym_classes/:id/delete" do
  gym_class = GymClass.find(params["id"])
  gym_class.delete()
  redirect to("/gym_classes")
end
