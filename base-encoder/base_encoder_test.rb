require 'minitest/autorun'
require_relative './base_encoder.rb'

class TestBaseEncoder < Minitest::Test
  def test_run
    bin = '01'
    oct = '01234567'
    dec = '0123456789'
    hex = '0123456789abcdef'
    allow = 'abcdefghijklmnopqrstuvwxyz'
    alup = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    alphanum = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

    assert_equal("10", convert('1010', bin, dec))
    assert_equal("10", convert('10', dec, dec))
    assert_equal("187213914", convert('ptrrre', allow, dec))
    assert_equal("11", convert('1011', bin, dec))

    assert_equal("1111", convert('15', dec, bin))
    assert_equal("17", convert('15', dec, oct))
    assert_equal("a", convert('0', dec, alpha))
    assert_equal("bb", convert('27', dec, allow))

    assert_equal(convert('1010', bin, hex), 'a')
    assert_equal(convert('hello', allow, hex), '320048')
    assert_equal(convert('SAME', alup, alup), 'SAME')
  end
end
