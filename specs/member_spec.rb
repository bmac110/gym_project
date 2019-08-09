require('minitest/autorun')
require('minitest/rg')
require_relative("../models/member.rb")

class MemberTest < MiniTest::Test

  def setup()
    # @member = Member.new("Martin Porter", "martinp@net.com", 07445507653, "standard" )
    options = {"id" => 1, "name" => "Martin Porter",
      "email" => "martinp@net.com", "phone" => 07445507653, "membership" => "standard"}

    @member = Member.new(options)
  end

  def test_get_name()
    assert_equal("Martin Porter", @member.name)
  end

end
