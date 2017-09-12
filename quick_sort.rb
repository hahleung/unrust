require 'pry'
require 'benchmark'

module QuickSort
  def self.qsort(list)
    return [] if list.size == 0
    x, *xs = *list
    less, more = xs.partition{ |y| y < x }
    qsort(less) + [x] + qsort(more)
  end

  def self.quick_sort(input)
    return [] if input.empty?
    pivot = input.first
    initial = { lower: [], upper: [] }

    sets = input.drop(1).reduce(initial) do |acc, ite|
      ite > pivot ? acc[:upper] << ite : acc[:lower] << ite
      acc
    end

    quick_sort(sets[:lower]) + [pivot] + quick_sort(sets[:upper])
  end
end
