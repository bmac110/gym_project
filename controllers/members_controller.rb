require_relative("../models/member.rb")
require_relative("../models/booking.rb")
require_relative("../models/gym_class.rb")


get "/members" do
  @members = Member.all()
  erb (:"members/index")
end

get "/members/new" do
  @members = Member.all()
  @membership = ["Standard", "Premium"]
  erb (:"members/new")
end


get "/members/:id" do
  @member = Member.find(params["id"].to_i())
  erb (:"members/show")
end

get "/members/:id/edit" do
  @member = Member.find(params["id"].to_i())
  erb(:"members/edit")
end

post "/members/:id" do
  member = Member.new(params)
  member.update
  redirect to("/members")
end

post "/members" do
  Member.new(params).save()
  redirect to("/members")
end

post "/members/:id/delete" do
  member = Member.find(params["id"])
  member.delete()
  redirect to("/members")
end
