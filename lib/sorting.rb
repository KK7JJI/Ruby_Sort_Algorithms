# frozen_string_literal: true

require_relative 'sorting/bubblesort'
require_relative 'sorting/insertionsort'
require_relative 'sorting/selectionsort'
require_relative 'sorting/quicksort'
require_relative 'sorting/mergesort'

# test sorting algorithms
class SortPerformance
  attr_accessor :sort_algorithm, :time

  def initialize(sort_algorithm: nil)
    @time = nil
    @operations = 0
    @sort_algorithm = sort_algorithm
  end

  def sort_performance(arr: nil)
    arr = random_array(count: 10) if arr.nil?
    sorted_arr, time = measure do
      sort_algorithm.sort(arr)
    end
    { initial_arr: arr,
      sorted_arr: sorted_arr,
      execution_time: time,
      operations: sort_algorithm.operations,
      comparisons: sort_algorithm.comparisons,
      pass: sorted?(sorted_arr) }
  end

  def random_array(count: 10)
    Array.new(count) { rand(100) }
  end

  def ordered_array(count: 10)
    (0...count).to.a.reverse
  end

  def measure
    start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = yield
    elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start
    [result, elapsed]
  end

  def sorted?(arr)
    arr.each_cons(2) do |a, b|
      return false if b < a
    end
    true
  end
end

n = 10_000
puts "Sorting N = #{n} records: "
puts ''
puts 'Bubblesort'

sort_method = SortPerformance.new(sort_algorithm: BubbleSort.new)
result = sort_method.sort_performance(arr: sort_method.random_array(count: n))
puts "Time to complete: #{result[:execution_time]}"
puts "Sort successful? #{result[:pass]}"
puts ''
puts 'Selectionsort'

sort_method = SortPerformance.new(sort_algorithm: SelectionSort.new)
result = sort_method.sort_performance(arr: sort_method.random_array(count: n))

puts ''
puts "Time to complete: #{result[:execution_time]}"
puts "Sort successful? #{result[:pass]}"
puts ''

puts 'Insertionsort'

sort_method = SortPerformance.new(sort_algorithm: InsertionSort.new)
result = sort_method.sort_performance(arr: sort_method.random_array(count: n))

puts ''
puts "Time to complete: #{result[:execution_time]}"
puts "Sort successful? #{result[:pass]}"
puts ''

puts 'Quicksort'

sort_method = SortPerformance.new(sort_algorithm: QuickSort.new)
result = sort_method.sort_performance(arr: sort_method.random_array(count: n))

puts ''
puts "Time to complete: #{result[:execution_time]}"
puts "Sort successful? #{result[:pass]}"
puts ''

puts 'Mergesort'
sort_method = SortPerformance.new(sort_algorithm: MergeSort.new)
result = sort_method.sort_performance(arr: sort_method.random_array(count: n))

puts ''
puts "Time to complete: #{result[:execution_time]}"
puts "Sort successful? #{result[:pass]}"
puts ''
