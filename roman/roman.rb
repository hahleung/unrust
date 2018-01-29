class RomanNumerals
  TABLE = {
    'M' => 1000,
    'D' => 500,
    'C' => 100,
    'L' => 50,
    'X' => 10,
    'V' => 5,
    'I' => 1,
  }.freeze

  def self.from_roman(roman)
    s = roman
      .chars
      .map { |c| TABLE[c] }
      .reverse
      .reduce([0, 0]) { |a, i| i < a.last ? [a.first - i, i] : [a.first + i, i] }
      .first
  end

  def self.to_roman(arabic)
    if arabic >= 1000
      'M' << to_roman(arabic - 1000)
    elsif arabic >= 900
      'CM' << to_roman(arabic - 900)
    elsif arabic >= 500
      'D' << to_roman(arabic - 500)
    elsif arabic >= 400
      'CD' << to_roman(arabic - 400)
    elsif arabic >= 100
      'C' << to_roman(arabic - 100)
    elsif arabic >= 90
      'XC' << to_roman(arabic - 90)
    elsif arabic >= 50
      'L' << to_roman(arabic - 50)
    elsif arabic >= 40
      'XL' << to_roman(arabic - 40)
    elsif arabic >= 10
      'X' << to_roman(arabic - 10)
    elsif arabic >= 9
      'IX' << to_roman(arabic - 9)
    elsif arabic >= 5
      'V' << to_roman(arabic - 5)
    elsif arabic >= 4
      'IV' << to_roman(arabic - 4)
    elsif arabic >= 1
      'I' << to_roman(arabic - 1)
    elsif arabic == 0
      ''
    end
  end
end

# That's a better solution!
# class RomanNumerals
#   ROMAN_NUMERAL = {
#     1000 => 'M',
#     900  => 'CM',
#     500  => 'D',
#     400  => 'CD',
#     100  => 'C',
#     90   => 'XC',
#     50   => 'L',
#     40   => 'XL',
#     10   => 'X',
#     9    => 'IX',
#     5    => 'V',
#     4    => 'IV',
#     1    => 'I'
#   }

#   def self.to_roman(number)
#     ROMAN_NUMERAL.keys.sort.reverse.inject('') do |str, val|
#       while number - val >= 0 do
#         number -= val
#         str << ROMAN_NUMERAL[val]
#       end
#       str
#     end
#   end

#   def self.from_roman(number)
#     roman_numeral = ROMAN_NUMERAL.invert
#     number.scan(Regexp.new(roman_numeral.keys.join('|'))).inject(0) do |number, key|
#       number + roman_numeral[key]
#     end
#   end
# end
