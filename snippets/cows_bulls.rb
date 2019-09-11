require 'pry'

module CowsBulls
  def self.shot(guess_word, truth_word)
    guess = guess_word.chars
    truth = truth_word.chars

    correct_letters = (guess & truth)
      .flat_map { |n| [n] * [guess.count(n), truth.count(n)].min }
      .size
    correct_positions = guess.zip(truth)
      .reduce(0) { |acc, (g, t)| g == t ? acc + 1 : acc }

    [correct_letters, correct_positions]
  end
end

puts CowsBulls.shot('nab', 'cow') == [0, 0]
puts CowsBulls.shot('tac', 'cow') == [1, 0]
puts CowsBulls.shot('cab', 'cow') == [1, 1]
puts CowsBulls.shot('cbo', 'cow') == [2, 1]
puts CowsBulls.shot('cob', 'cow') == [2, 2]
puts CowsBulls.shot('cow', 'cow') == [3, 3]
