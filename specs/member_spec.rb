require('minitest/autorun')
require('minitest/rg')
require_relative("../models/member.rb")

class MemberTest < MiniTest::Test

  def setup()
    options = {"id" => 1, "first_name" => "Ronald", "last_name" => "Macdonald",
      "email" => "macgains@net.com", "phone" => "07445507653", "membership" => "standard"}

    @member = Member.new(options)
  end

  def test_get_first_name()
    assert_equal("Ronald", @member.first_name)
  end

  def test_get_last_name()
    assert_equal("Macdonald", @member.last_name)
  end

  def test_get_email()
    assert_equal("macgains@net.com", @member.email)
  end

  def test_get_phone()
    assert_equal("07445507653", @member.phone)
  end

  def test_get_membership()
  assert_equal("standard", @member.membership)
  end

end
