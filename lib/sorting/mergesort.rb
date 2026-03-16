# frozen_string_literal: true

# merge sort algorithm
class MergeSort
  attr_accessor :operations, :comparisons

  def initialize
    @operations = 0
    @comparisons = 0
  end

  def sort(arr)
    arr = arr.dup
    self.operations = 0
    self.comparisons = 0
    mergesort(arr)
  end

  private

  def mergesort(arr)
    # puts "mergesort: arr = #{arr.inspect}: length = #{arr.length}"
    return arr unless arr.length > 1

    larr, rarr = partition(arr)
    larr = mergesort(larr)
    rarr = mergesort(rarr)
    merge(larr, rarr)
  end

  def partition(arr)
    left = arr.slice(0, arr.length / 2)
    right = arr.slice(arr.length / 2, arr.length)
    # puts "left = #{left.inspect}"
    # puts "right = #{right.inspect}"
    [left, right]
  end

  def merge(larr, rarr)
    # puts "larr = #{larr.inspect}"
    # puts "rarr = #{rarr.inspect}"

    arr = []
    until merged?(larr, rarr)

      arr << if rarr.empty?
               self.comparisons += 1
               larr.shift
             elsif larr.empty?
               self.comparisons += 2
               rarr.shift
             elsif larr[0] <= rarr[0]
               self.comparisons += 3
               larr.shift
             else
               self.comparisons += 3
               rarr.shift
             end
      self.operations += 1
    end
    # puts "merge: arr = #{arr.inspect}"
    arr
  end

  def merged?(larr, rarr)
    self.comparisons += 2
    return true if larr.empty? && rarr.empty?

    false
  end
end
