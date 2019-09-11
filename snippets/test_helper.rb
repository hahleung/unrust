require 'minitest/autorun'

class Test < Minitest::Test
  def self.assert_equals(eval, expected)
    if eval != expected
      raise "\n Hem, was expecting: \n\n#{expected} \n\n received: \n\n#{eval}"
    else
      p "Yay, that's it mate!"
    end
  end
end
