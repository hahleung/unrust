require 'minitest/autorun'
require_relative 'car.rb'

class CarTest < MiniTest::Unit::TestCase
  def test_start_engine_moto_case
    type = "moto"
    expected_engine = "vroom with 2"
    assert_equal(expected_engine, Car.new(type).start_engine)
  end

  def test_start_engine_moto_case
    type = "car"
    expected_engine = "vroom with 4"
    assert_equal(expected_engine, Car.new(type).start_engine)
  end
end
