require('minitest/autorun')
require('minitest/rg')

class MemberTest < MiniTest::Test

  def setup()
    @member = Member.new("Martin Porter", )
  end
