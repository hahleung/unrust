require "minitest/autorun"
require_relative './cola.rb'

class TestCola < Minitest::Test
  def test_run
    names = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]
    assert_equal("Sheldon", whoIsNext(names, 1))

    assert_equal("Howard", whoIsNext(names, 5))
    assert_equal("Sheldon", whoIsNext(names, 6))
    assert_equal("Sheldon", whoIsNext(names, 7))

    assert_equal("Penny", whoIsNext(names, 52))
    assert_equal("Leonard", whoIsNext(names, 7230702951))
  end
end
