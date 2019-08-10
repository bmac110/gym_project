require_relative("../models/member.rb")

get "/members" do
  @members = Member.all()
  erb (:"members/index")
end

get "/members/:id" do
  @member = Member.find(params["id"].to_i())
  erb (:"members/show")
end
