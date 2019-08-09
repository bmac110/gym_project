require('minitest/autorun')
require('minitest/rg')

class MemberTest < MiniTest::Test

  def setup()
    @member = Member.new("Martin Porter", "martinp@net.com", 07445507653, "standard" )
  end

  def test_get_name()
    assert_equal("Martin Porter", @member.name)
  end
