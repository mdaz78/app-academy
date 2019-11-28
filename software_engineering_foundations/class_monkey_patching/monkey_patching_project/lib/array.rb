# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    length = self.length
    sum = self.sum
    sum / (length * 1.0)
  end

  def median
    return nil if self.empty?

    arr = self.sort
    length = arr.length

    if length % 2 == 0
      mid = length / 2
      before_mid = mid - 1
      return (arr[mid] + arr[before_mid]) / 2.0
    else
      mid = length / 2
      return arr[mid]
    end
  end

  def counts
    count_hash = Hash.new(0)
    self.each { |el| count_hash[el] += 1 }
    return count_hash
  end

  def my_count(element)
    count = 0
    self.each do |arr_element|
      count += 1 if element == arr_element
    end

    count
  end

  def my_index(element)
    self.each_with_index do |arr_element, index|
      return index if element == arr_element
    end

    nil
  end

  def my_uniq
    seen = []
    result = []

    self.each do |el|
      result << el unless seen.include?(el)
      seen << el
    end

    result
  end

  def my_transpose
    transposed_arr = []

    (0...self.length).each do |row|
      new_row = []

      (0...self.length).each do |col|
        new_row << self[col][row]
      end

      transposed_arr << new_row
    end

    transposed_arr
  end
end
