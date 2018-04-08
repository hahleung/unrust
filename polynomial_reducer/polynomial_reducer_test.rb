require 'minitest/autorun'
require_relative './polynomial_reducer.rb'

class TestPolynomialReducer < Minitest::Test
  def test_run
    assert_equal(PolynomialReducer.simplify("dc+dcba"), "cd+abcd")
    assert_equal(PolynomialReducer.simplify("2xy-yx"),"xy")
    assert_equal(PolynomialReducer.simplify("-a+5ab+3a-c-2a"),"-c+5ab")
    assert_equal(PolynomialReducer.simplify("-abc+3a+2ac"),"3a+2ac-abc")
    assert_equal(PolynomialReducer.simplify("xyz-xz"),"-xz+xyz")
    assert_equal(PolynomialReducer.simplify("a+ca-ab"),"a-ab+ac")
    assert_equal(PolynomialReducer.simplify("xzy+zby"),"byz+xyz")
    assert_equal(PolynomialReducer.simplify("-y+x"),"x-y")
    assert_equal(PolynomialReducer.simplify("y-x"),"-x+y")
    assert_equal(PolynomialReducer.simplify("+n-5hn+7tjhn-4nh-3n-6hnjt+2jhn+9hn"), "-2n+2hjn+hjnt")
    assert_equal(PolynomialReducer.simplify("-11xca-8x+8x+13xc"), "13cx-11acx")
  end
end
