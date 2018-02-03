require 'minitest/autorun'
require_relative './fractions.rb'

class TestFractions < Minitest::Test
  def test_run
    assert_equal(proper_fractions(1), 0)
    assert_equal(proper_fractions(2), 1)
    assert_equal(proper_fractions(5), 4)
    assert_equal(proper_fractions(15), 8)
    assert_equal(proper_fractions(25), 20)

    assert_equal(proper_fractions(9999999), 6637344)
    assert_equal(proper_fractions(1532420), 608256)
    assert_equal(proper_fractions(500000003), 500000002)
    assert_equal(proper_fractions(123456789), 82260072)
  end
end
