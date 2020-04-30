require 'byebug'

def factors(num)
  facts = []
  (1..num).each do |el|
    facts << el if num % el == 0
  end
  facts
end


def subwords(string, dictionary)
  subwords = []
  dictionary.each do |word|
    subwords << word if string.include?(word)
  end
  subwords
end

def doubler(array)
  array.map { |el| el * 2 }
end

def concatenate(arr_of_strings)
  arr_of_strings.inject do |acc, str|
    acc += str
  end
end


# frozen_string_literal: true
class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    sorted = false
    until sorted
      sorted = true
      i = 0
      while i < length - 1
        if prc.call(self[i], self[i + 1]) == 1
          sorted = false
          self[i], self[i + 1] = self[i + 1], self[i]
        end
        i += 1
      end
    end
    self
  end

  def bubble_sort(&prc)
    arr = dup
    arr.bubble_sort!(&prc)
  end

  def my_each(&prc)
    length = self.length
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    result = []
    each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    each { |el| result << el unless prc.call(el) }
    result
  end

  def my_any?(&prc)
    each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    flattened = []

    each do |el|
      if el.is_a? Array
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end
    flattened
  end

  def my_zip(*args)
    result = []

    each_with_index do |el, self_index|
      small = []
      small << el

      args.each do |arr|
        small << arr[self_index]
      end

      result << small
    end

    result
  end

  def my_rotate(positions = 1)
    split_idx = positions % length

    drop(split_idx) + take(split_idx)
  end

  def my_join(separator = '')
    result = ''
    each_with_index do |el, index|
      result += el
      result += separator if index != length - 1
    end

    result
  end

  def my_reverse
    result = []
    i = length - 1
    while i >= 0
      result << self[i]
      i -= 1
    end

    result
  end

  def my_map(&prc)
    arr = []
    each do |el|
      arr << prc.call(el)
    end
    arr
  end

  def my_inject(acc = nil, &prc)
    first_index = acc.nil? ? 1 : 0
    acc ||= first
    (first_index...length).each do |el|
      acc = prc.call(acc, self[el])
    end
    acc
  end

end

## TESTS ##

# my_each test
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# my_select test
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# my_reject test
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# my_any? test
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# my_all? test
# a = [1, 2, 3]
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# my_flatten test
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# my_zip test
# a = [4, 5, 6]
# b = [7, 8, 9]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1, 2], [8]) # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8]]
# #
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d) # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# my_rotate test
# a = ["a", "b", "c", "d"]
# p a.my_rotate #=> ["b", "c", "d", "a"]
# p a.my_rotate(2) #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3) #=> ["b", "c", "d", "a"]
# p a.my_rotate(15) #=> ["d", "a", "b", "c"]

# my_join test
# a = ["a", "b", "c", "d"]
# p a.my_join == "abcd"
# p a.my_join("$") == "a$b$c$d"

# my_reverse test
# p ["a", "b", "c"].my_reverse #=> ["c", "b", "a"]
# p [1].my_reverse #=> [1]