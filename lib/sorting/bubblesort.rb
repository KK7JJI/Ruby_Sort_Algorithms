# frozen_string_literal: true

# bubble sort algorithm
class BubbleSort
  attr_accessor :operations, :comparisons

  def initialize
    @operations = 0
    @comparisons = 0
  end

  def sort(arr)
    arr = arr.dup
    self.operations = 0
    self.comparisons = 0

    (arr.length - 1).times do |i|
      bubble_up(arr, i)
    end
    arr
  end

  private

  def bubble_up(arr, i)
    (arr.length - i - 1).times do |j|
      # puts "#{arr[j + 1]} < #{arr[j]}, #{arr[j + 1] < arr[j]}"
      swap(arr, j, j + 1) if arr[j + 1] < arr[j]
      self.comparisons += 1
    end
  end

  def swap(arr, left, right)
    arr[left], arr[right] = arr[right], arr[left]
    self.operations += 3
  end
end
