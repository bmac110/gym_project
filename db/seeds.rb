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
  "membership" => "Standard"
  })

member2 = Member.new({
  "first_name" => "Dennis",
  "last_name" => "Reynolds",
  "email" => "goldengod@net.com",
  "phone" => "07441107653",
  "membership" => "Standard"
  })

member3 = Member.new({
  "first_name" => "Dee",
  "last_name" => "Reynolds",
  "email" => "giantbird@net.com",
  "phone" => "07351107653",
  "membership" => "Standard"
  })

member1.save()
member2.save()
member3.save()

gym_class1 = GymClass.new({
  "title" => "Zumba",
  "instructor" => "Laura",
  "capacity" => 25,
  "start_time" => "18:00"
  })

gym_class2 = GymClass.new({
  "title" => "Circuits",
  "instructor" => "Rickety Cricket",
  "capacity" => 25,
  "start_time" => "19:00"
  })

gym_class1.save()
gym_class2.save()

booking1 = Booking.new({
  "member_id" => member1.id,
  "gym_class_id" => gym_class1.id
  })

booking2 = Booking.new({
  "member_id" => member2.id,
  "gym_class_id" => gym_class1.id
  })

booking1.save()
booking2.save()

binding.pry
nil
