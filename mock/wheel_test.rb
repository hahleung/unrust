require 'minitest/autorun'
require_relative 'wheel.rb'

class WheelTest < MiniTest::Unit::TestCase
  def test_get_from_moto_case
    type = "moto"
    assert_equal(2, Wheel.get_from(type))
  end

  def test_get_from_non_moto_case
    type = "car"
    assert_equal(4, Wheel.get_from(type))
  end
end
