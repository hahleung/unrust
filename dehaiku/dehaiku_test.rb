require 'minitest/autorun'
require_relative './dehaiku.rb'

class TestDehaiku < Minitest::Test
  def test_run
    assert_equal(
      ['a', 'of', 'on'],
      top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
    )

    assert_equal(
      ['e', 'ddd', 'aa'],
      top_3_words('e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e')
    )

    assert_equal(
      ["won't", "wont"],
      top_3_words("  //wont won't won't")
    )

    assert_equal(
      ["e"],
      top_3_words("  , e   .. ")
    )

    assert_equal(
      [],
      top_3_words("  '  ")
    )
  end
end
