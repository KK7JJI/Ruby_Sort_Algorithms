# frozen_string_literal: true

# insertion sort algorithm
class InsertionSort
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
      shift_and_insert(arr, i)
    end

    arr
  end

  private

  def shift_and_insert(arr, i)
    key = arr[i]
    j = i - 1
    while arr[j] > key && j >= 0
      arr_shift(arr, j)
      j -= 1
    end
    arr[j + 1] = key
    self.operations += 1
  end

  def arr_shift(arr, j)
    arr[j + 1] = arr[j]
    self.operations += 1
    self.comparisons += 2
  end
end
