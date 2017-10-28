require 'pry'
require 'ostruct'

n = 100
matrix = n.times.map do |_|
  n.times.map do |_|
    ('a'..'z').to_a.sample
  end
end
  
# matrix = [
#   %w(r b c y),
#   %w(d e f t),
#   %w(e r g h),
#   %w(z r g r)
# ]

word = 'abc'

SCALE = [-1, 0, 1]
RANGE = SCALE.product(SCALE).select { |i| i != [0, 0] }

coordinates = matrix.flat_map.with_index do |line, y|
  line.map.with_index do |element, x|
    [x.to_s + y.to_s, element]
  end
end.to_h

initial_candidate = OpenStruct.new(keys: [], coordinates: coordinates)

chains = word.each_char.reduce([initial_candidate]) do |candidates, char|
  candidates.flat_map do |candidate|
    keys = candidate.coordinates.select { |_, v| v == char }.keys

    keys.map do |key|
      key_x = key[0].to_i
      key_y = key[1].to_i

      valid_keys = RANGE
        .map { |x, y| [x + key_x, y + key_y].join }
        .select { |k| coordinates.keys.include?(k) && !candidate.keys.include?(k) }

      new_keys = candidate.keys + [key]
      new_coordinates = coordinates.select { |k, _| valid_keys.include?(k) }
      OpenStruct.new(keys: new_keys, coordinates: new_coordinates)
    end
  end
end

puts chains.count
puts chains.empty?
