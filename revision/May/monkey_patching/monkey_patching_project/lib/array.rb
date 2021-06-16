# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if length == 0
    max - min
  end

  def average
    return nil if length == 0
    sum / (length * 1.0)
  end

  def median
    return nil if length == 0

    sorted_arr = sort
    arr_len = length

    if arr_len.odd?
      middle_index = arr_len / 2
      sorted_arr[middle_index]
    else
      middle_index = arr_len / 2
      (sorted_arr[middle_index] + sorted_arr[middle_index - 1]) / 2.0
    end
  end

  def counts
    count_hash = Hash.new(0)

    each do |el|
      count_hash[el] += 1
    end

    count_hash
  end

  def my_count(el)
    count = 0

    each do |x|
      count += 1 if el == x
    end

    count
  end

  def my_index(el)
    return nil unless include?(el)

    each.with_index do |element, index|
      return index if el == element
    end

    nil
  end

  def my_uniq()
    uniq_arr = []

    each do |el|
      uniq_arr << el unless uniq_arr.include?(el)
    end

    uniq_arr
  end

  def my_transpose()
    transposed_arr = Array.new(length) { Array.new(length) }

    each.with_index do |arr, index1|
      arr.each.with_index do |el, index2|
        transposed_arr[index2][index1] = el
      end
    end

    transposed_arr
  end
end
