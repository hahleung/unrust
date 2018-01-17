require "minitest/autorun"
require_relative './zeroes.rb'

class TestMeme < Minitest::Test
  def test_run
    assert_equal(zeros(12), 2)
    assert_equal(zeros(6), 1)
    assert_equal(zeros(1000), 249)
    assert_equal(zeros(777), 193)
    assert_equal(zeros(100_000_000), 24999999)
  end
end
