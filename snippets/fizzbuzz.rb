module FizzBuzz
  FIZZ = "Fizz".freeze
  BUZZ = "Buzz".freeze

  def self.fizzbuzz(n)
    n.times.map do |j|
      i = j + 1
      output = "#{FIZZ if i % 3 == 0}#{BUZZ if i % 5 == 0}"
      output.empty? ? i : output
    end
  end
end

puts FizzBuzz.fizzbuzz(15)
