require_relative 'quick_sort'
require 'pry'
require 'benchmark'

input = 100000.times.map { |_| rand(1..100) }

LABEL_SIZE = 15
Benchmark.bm(LABEL_SIZE) do |x|
  x.report("Ruby .sort") { input.sort }
  x.report("qsort") { QuickSort.qsort(input) }
  x.report("quick_sort") { QuickSort.quick_sort(input) }
end
