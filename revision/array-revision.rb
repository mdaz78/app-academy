# Intro to programming

# Arrays

# 1. Write a method doubler(numbers) that takes an array of numbers and returns
#    a new array where every element of the original array is multiplied by 2.

def doubler(numbers)
  numbers.map do |num|
    num * 2
  end
end

# print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
# puts
# print doubler([7, 1, 8])    # => [14, 2, 16]

# 2. Write a method yell(words) that takes in an array of words and returns a
#    new array where every word from the original array has an exclamation point
#    after it.

def yell(words)
  words.map do |word|
    word + "!"
  end
end

# print yell(["hello", "world"]) # => ["hello!", "world!"]
# puts
# print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]

# 3. Write a method element_times_index(nums) that takes in an array of numbers
#    and returns a new array containing every number of the original array
#    multiplied with its index.

def element_times_index(nums)
  nums.map.with_index do |num, index|
    num * index
  end
end

# print element_times_index([4, 7, 6, 5])       # => [0, 7, 12, 15]
# puts
# print element_times_index([1, 1, 1, 1, 1, 1]) # => [0, 1, 2, 3, 4, 5]

# 4. Write a method even_nums(max) that takes in a number max and returns an
#    array containing all even numbers from 0 to max

def even_nums(max)
  evens = []
  0.upto(max) do |n|
    evens << n if n.even?
  end

  evens
end

# print even_nums(10) # => [0, 2, 4, 6, 8, 10]
# puts
# print even_nums(5)  # => [0, 2, 4]

# 5. Write a method range(min, max) that takes in two numbers min and max. The
#    method should return an array containing all numbers from min to max
#    inclusive.

def range(min, max)
  ranges = []
  min.upto(max) { |n| ranges << n }
  ranges
end

# print range(2, 7)   # => [2, 3, 4, 5, 6, 7]
# puts
# print range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]

# 6. Write a method odd_range(min, max) that takes in two numbers min and max.
#    The method should return an array containing all odd numbers from min to
#    max (inclusive).

def odd_range(min, max)
  ranges = []
  min.upto(max) { |n| ranges << n unless n.even? }
  ranges
end

# print odd_range(11, 18) # => [11, 13, 15, 17]
# puts
# print odd_range(3, 7)   # => [3, 5, 7]

# 7. Write a method reverse_range(min, max) that takes in two numbers min and
#    max.The function should return an array containing all numbers from min to
#    max in reverse order.The min and max should be excluded from the array

def reverse_range(min, max)
end

print reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]
puts
print reverse_range(1, 7)   # => [6, 5, 4, 3, 2]

# 8. Write a method first_half(array) that takes in an array and returns a new
#    array containing the first half of the elements in the array. If there is
#    an odd number of elements, return the first half including the middle
#    element.

# 9. Write a method factors_of(num) that takes in a num and returns an array of
#    all positive numbers less than or equal to num that can divide num.

# 10. Write a method select_odds(numbers) that takes in an array of numbers and
#     returns a new array containing the odd numbers of the original array.

# 11. Write a method select_long_words(words) that takes in an array of words
#     and returns a new array containing all of the words of the original array
#     that are longer than 4 characters.

# 12. Write a method sum_elements(arr1, arr2) that takes in two arrays. The
#     method should return a new array containing the results of adding together
#     corresponding elements of the original arrays. You can assume the arrays
#     have the same length.

# 13. Write a method sum_elements(arr1, arr2) that takes in two arrays. The
#     method should return a new array containing the results of adding together
#     corresponding elements of the original arrays. You can assume the arrays
#     have the same length.

# 14. Write a method fizz_buzz(max) that takes in a number max and returns an
#     array containing all numbers greater than 0 and less than max that are
#     divisible by either 4 or 6, but not both.
