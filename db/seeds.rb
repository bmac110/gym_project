require_relative("../models/booking.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/member.rb")
require("pry-byebug")

member1 = Member.new({
  "first_name" => "Ronald",
  "second_name" => "Macdonald",
  "email" => "macgains@net.com",
  "phone" => "07445507653",
  "membership" => "standard"
  })

member1.save()


binding.pry
nil
