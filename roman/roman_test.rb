require 'minitest/autorun'
require_relative './roman.rb'

class TestRoman < Minitest::Test
  def test_run
    assert_equal(1000, RomanNumerals.from_roman('M'))
    assert_equal(1666, RomanNumerals.from_roman('MDCLXVI'))
    assert_equal(2008, RomanNumerals.from_roman('MMVIII'))
    assert_equal(1, RomanNumerals.from_roman('I'))
    assert_equal(4, RomanNumerals.from_roman('IV'))
    assert_equal(21, RomanNumerals.from_roman('XXI'))

    assert_equal('M', RomanNumerals.to_roman(1000))
    assert_equal('MMVIII', RomanNumerals.to_roman(2008))
    assert_equal('MDCLXVI', RomanNumerals.to_roman(1666))
    assert_equal('I', RomanNumerals.to_roman(1))
    assert_equal('IV', RomanNumerals.to_roman(4))
    assert_equal('XXI', RomanNumerals.to_roman(21))
  end
end
