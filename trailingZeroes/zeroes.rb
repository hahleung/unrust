require 'pry'

def zeros(number)
  pow = 1
  powers = []

  while 5 ** pow < number do
    powers << 1.0 / 5 ** pow
    pow = pow + 1
  end

  powers.reduce(0) do |result, power|
    result + (number * power).to_s.split(".").first.to_i
  end
end

# Lol definitely smarter people over here...
# def zeros(n)
#   n < 5 ? 0 : (n / 5) + zeros(n / 5)
# end

# def zeros(n)
#   (1..Math.log(n, 5)).inject(0) { |sum, k| sum + n / 5**k }
# end
