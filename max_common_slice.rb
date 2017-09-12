require 'pry'
require 'json'
require 'benchmark'

def sanitize(input)
  arr = input.split(',').map(&:to_i)
  return arr.size if [0, 1].include?(arr.size)
end

def max_slice(input)
  arr = input.split(',').map(&:to_i)
  return arr.size if [0, 1].include?(arr.size)
  maximum = []

  arr.each.with_index do |x, j|
    for i in j..arr.length-1
      if arr[j..i].uniq.count == 2
        maximum << arr[j..i].length
      end
    end
  end

  maximum.max
end

def max_slice_2(input)
  arr = input.split(',').map(&:to_i)
  return arr.size if [0, 1].include?(arr.size)

  (0..arr.size).to_a
    .combination(2)
    .map { |i| arr[i[0]...i[1]] }
    .select { |x| x.uniq.count == 2 }
    .map(&:size)
    .max
end

def max_slice_3(input)
  arr = input.split(',').map(&:to_i)
  return 1 if arr.size == 2 && arr.uniq.size == 1
  return arr.size if [0, 1, 2].include?(arr.size)

  seed = { last_int: nil, last_int_count: 0, int: nil, count: 0, candidate: 0 }

  arr.reduce(seed) do |a, i|
    if a[:last_int] != i
      if a[:int] != i
        a[:candidate] = [a[:count] + a[:last_int_count], a[:candidate]].max
        a[:count] = a[:last_int_count]
      else
        a[:count] += a[:last_int_count]
      end

      a[:int] = a[:last_int]
      a[:last_int] = i
      a[:last_int_count] = 1
    elsif a[:last_int] == i
      a[:last_int_count] += 1
      puts a[:count] + a[:last_int_count]
      a[:candidate] = [a[:count] + a[:last_int_count], a[:candidate]].max
    end
    p i
    p a
    a
  end[:candidate]
end

input = "0,1,0,1,2,3,4,5,6,7,8,9,0,1,0,1,0,1"
#input = "1,1,1,2,2,2,3,3,3,3,3,3"
#input = "1, 1, 1, 2, 2, 2, 1, 1, 2, 2, 6, 2, 1, 8"
p max_slice_3(input)
exit

# Proof of concept
inline_data = JSON.parse(File.read("max_common_slice.json"))["set"]
inline_data.each do |data|
  input = data["input"]
  output = data["output"]
  p input
  p output
  p max_slice(input) == output
  p max_slice_2(input) == output
  p max_slice_3(input) == output
  p max_slice_3(input)
  puts ""
end

# Benchmark
input = 100.times.map { |_| rand(1..100) }.join(",")

LABEL_SIZE = 15
Benchmark.bm(LABEL_SIZE) do |x|
  x.report("max_slice") { max_slice(input) }
  x.report("max_slice_2") { max_slice_2(input) }
  x.report("max_slice_3") { max_slice_3(input) }
end
