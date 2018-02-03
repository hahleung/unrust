require 'pry'
# http://www.cs.trincoll.edu/~ram/cpsc110/inclass/conversions.html

def convert(input, source, target)
  from_decimal(to_decimal(input, source), target, '')
end

def to_decimal(input, source)
  source_base = source.size

  input
    .reverse
    .chars
    .each_with_index
    .map { |char, index| [source.index(char), index] }
    .reduce(0) { |decimal, (char, index)| decimal + char * source_base**index }
end

def from_decimal(decimal, target, result)
  target_base = target.size

  new_decimal = decimal / target_base
  result << target[decimal % target_base]

  return result.reverse if new_decimal.zero?
  from_decimal(new_decimal, target, result)
end
