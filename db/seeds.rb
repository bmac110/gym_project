require_relative("../models/booking.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/member.rb")
require("pry-byebug")

Booking.delete_all()
Member.delete_all()
GymClass.delete_all()

member1 = Member.new({
  "first_name" => "Ronald",
  "last_name" => "Macdonald",
  "email" => "macgains@net.com",
  "phone" => "07445507653",
  "membership" => "standard"
  })

member1.save()

gym_class1 = GymClass.new({
  "title" => "Zumba",
  "instructor" => "Laura",
  "capacity" => "25",
  "start_time" => "18:00"
  })

gym_class1.save()

booking1 = Booking.new({
  "member_id" => member1.id,
  "gym_class_id" => gym_class1.id
  })

booking1.save()


binding.pry
nil
