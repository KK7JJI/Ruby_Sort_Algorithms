# frozen_string_literal: true

# quicksort algorithm
class QuickSort
  attr_accessor :operations, :comparisons

  def initialize
    @operations = 0
    @comparisons = 0
  end

  def sort(arr)
    self.operations = 0
    self.comparisons = 0
    arr = arr.dup

    quicksort(arr)
  end

  private

  def quicksort(arr)
    # puts "Quicksort, Array = #{arr.inspect}"
    # base case
    self.comparisons += 1
    return arr unless arr.length > 1

    # recursive case
    left, right = partition(arr)
    left = quicksort(left)
    right = quicksort(right)

    left + right
  end

  def partition(arr)
    pivot = arr.length - 1
    i = -1

    # puts "pivot #{pivot}, #{arr[pivot]}"
    (arr.length - 1).times do |j|
      self.comparisons += 1
      next unless arr[j] <= arr[pivot]

      i += 1
      swap(arr, i, j)
    end
    swap(arr, i + 1, pivot)

    [arr.slice(0, i + 1), arr.slice(i + 1, arr.length)]
  end

  def swap(arr, i, j)
    arr[i], arr[j] = arr[j], arr[i]
    self.operations += 3
  end
end
