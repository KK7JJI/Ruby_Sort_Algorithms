# frozen_string_literal: true

# selection sort algorithm
class SelectionSort
  attr_accessor :operations, :comparisons

  def initialize
    @operations = 0
    @comparisons = 0
  end

  def sort(arr)
    arr = arr.dup
    self.operations = 0
    self.comparisons = 0

    arr.length.times do |i|
      select_and_swap(arr, i)
    end
    arr
  end

  def select_and_swap(arr, i)
    max = 0 # the index
    (arr.length - i).times do |j|
      max = j if arr[j] > arr[max]
      self.comparisons += 1
    end
    swap(arr, max, i)
  end

  def swap(arr, max, i)
    pos = arr.length - i - 1
    arr[max], arr[pos] = arr[pos], arr[max]
    self.operations += 3
    arr
  end
end
