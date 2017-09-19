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

# For n = 100_000
#                      user     system      total        real
#                      Ruby .sort        0.010000   0.010000   0.020000 (  0.006911)
#                      qsort             4.490000   0.300000   4.790000 (  4.798306)
#                      quick_sort        6.240000   0.200000   6.440000 (  6.443518)
