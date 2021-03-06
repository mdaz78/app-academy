## Phase 1 ##

# Write a method strange_sums that accepts an array of numbers as an argument.
# The method should return a count of the number of distinct pairs of elements
# that have a sum of zero. You may assume that the input array contains
# unique elements.
def strange_sums(arr)
  distinct_pairs = 0

  (0...arr.length).each do |outer_index|
    (outer_index + 1...arr.length).each do |inner_index|
      distinct_pairs += 1 if arr[outer_index] + arr[inner_index] == 0
    end
  end

  distinct_pairs
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0


# Write a method pair_product that accepts an array of numbers and a product as arguments.
# The method should return a boolean indicating whether or not a pair of distinct elements
# in the array result in the product when multiplied together.
# You may assume that the input array contains unique elements.
def pair_product(arr, product)
  (0...arr.length - 1).each do |outer_index|
    (outer_index + 1...arr.length).each do |inner_index|
      return true if arr[outer_index] * arr[inner_index] == product
    end
  end

  false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false


# Write a method rampant_repeats that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string
# are repeated the number of times specified by the hash. If a character
# does not exist as a key of the hash, then it should remain unchanged.
def rampant_repeats(str, hash)
  repeat_str = ""

  str.each_char do |char|
    if hash.has_key?(char)
      number_of_times_to_repeat = hash[char]
      repeat = char * number_of_times_to_repeat
      repeat_str += repeat
    else
      repeat_str += char
    end
  end

  repeat_str
end


# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


# Write a method perfect_square? that accepts a number as an argument.
# The method should return a boolean indicating whether or not the argument
# is a perfect square. A perfect square is a number that is the product of
# some number multiplied by itself. For example,
# since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares;
# 35 is not a perfect square.
def perfect_square?(num)
  (1..num).each do |n|
    return true if n * n == num
  end
  false
end

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false



def get_total_number_of_factors(number)
  total_number_of_factors = 0;
  (1..number).each do |n|
    total_number_of_factors += 1 if number % n == 0
  end
  total_number_of_factors
end


## Phase 2 ##


# Write a method anti_prime? that accepts a number as an argument.
# The method should return true if the given number has more divisors
# than all positive numbers less than the given number.
# For example, 24 is an anti-prime because it has more divisors than any
# positive number less than 24. Math Fact: Numbers that meet this
# criteria are also known as highly composite numbers.
def anti_prime?(number)
  factors_of_given_number = get_total_number_of_factors(number);
  (1...number).each do |n|
    factors_of_current_number = get_total_number_of_factors(n);
    if factors_of_current_number > factors_of_given_number
      return false
    end
  end
  return true
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# Let a 2-dimensional array be known as a "matrix".
# Write a method matrix_addition that accepts two matrices as
# arguments. The two matrices are guaranteed to have the same
# "height" and "width". The method should return a new matrix
# representing the sum of the two arguments. To add matrices,
# we simply add the values at the same positions:
def matrix_addition(matrix_1, matrix_2)
  row_length = matrix_1.length
  col_length = matrix_1.first.length
  sum_of_matrix = Array.new(row_length) { Array.new(col_length) }
  (0...row_length).each do |row|
    (0...col_length).each do |col|
      sum_of_matrix[row][col] = matrix_1[row][col] + matrix_2[row][col]
    end
  end
  sum_of_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


# Write a method mutual_factors that accepts any amount of numbers as arguments.
# The method should return an array containing all of the common divisors 
# shared among the arguments. For example, the common 
# divisors of 50 and 30 are 1, 2, 5, 10. 
# You can assume that all of the arguments are positive integers.
def mutual_factors(*numbers)
  common_divisors = []
  biggest_num = numbers.max
  (1..biggest_num).each do |divisor|
    if numbers.all? { |n| n % divisor == 0 }
      common_divisors << divisor
    end
  end
  common_divisors
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]


# The tribonacci sequence is similar to that of Fibonacci. 
# The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the 
# previous three numbers. The first six numbers of tribonacci sequence are:
#
# 1, 1, 2, 4, 7, 13, ... and so on
#
# Write a method tribonacci_number that accepts a number argument, 
# n, and returns the n-th number of the tribonacci sequence.

def tribonacci_number(num)
  if num == 3
    return 2
  end

  if num == 2 || num == 1
    return 1
  end

  tribonacci_number(num - 3) + tribonacci_number(num - 2) + tribonacci_number(num - 1);
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274


## Phase 3 ##

# Write a method matrix_addition_reloaded that accepts any number of matrices
# as arguments. The method should return a new matrix representing the sum of
# the arguments. Matrix addition can only be performed on matrices of similar
# dimensions, so if all of the given matrices do not have the same "height" and
# "width", then return nil.
def matrix_addition_reloaded(*matrices)
  first_matrix = matrices.first
  height = first_matrix.length
  width = first_matrix.first.length

  empty_matrix = Array.new(height) { [0] * width }
  matrices.inject(empty_matrix) do |sum, matrix|
    return nil if matrix.length != height or matrix[0].length != width
    matrix_addition(sum, matrix)
  end
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# Write a method squarocol? that accepts a 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not any row or
# column is completely filled with the same element. You may assume that the
# 2-dimensional array has "square" dimensions, meaning it's height is the same
# as it's width.

def squarocol?(grid)
  return true if grid.any? { |arr| arr.uniq.length == 1 }
  return true if grid.transpose.any? { |arr| arr.uniq.length == 1 }
  false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true
#
# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true
#
# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false
#
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true
#
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The
# top of the pyramid is the number 1. To generate further levels of the
# pyramid, every element is the sum of the element above and to the left with
# the element above and to the right. Nonexisting elements are treated as 0
# when calculating the sum. For example, here are the first 5 levels of
# Pascal's triangle:

#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1

# Write a method pascals_triangle that accepts a positive number, n, as an
# argument and returns a 2-dimensional array representing the first n levels of
# pascal's triangle.
# Examples
def adjacent_sum(arr)
  sums = []
  (0...arr.length - 1).each do |idx|
    sum = arr[idx] + arr[idx + 1]
    sums << sum
  end
  sums
end


def pascals_triangle(n)
  triangle = [ [1] ]
  while triangle.length < n
    next_level = [1]
    level_above = triangle.last
    adjacent_sum_arr = adjacent_sum(level_above)
    next_level = [*next_level, *adjacent_sum_arr] if adjacent_sum_arr.length > 0
    next_level << 1
    triangle << next_level
  end

  triangle
end

# p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

## Phase 4 ##

# mersenne_prime
# A "Mersenne prime" is a prime number that is one less than a power of 2. This
# means that it is a prime number with the form 2^x - 1, where x is some
# exponent. For example:
#
# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1 7 is a Mersenne
# prime because it is prime and 7 = 2^3 - 1 11 is not a Mersenne prime
# because although it is prime, it does not have the form 2^x - 1
#
# The first three Mersenne primes are 3, 7, and 31. Write a method
# mersenne_prime that accepts a number, n, as an argument and returns the n-th
# Mersenne prime.

def is_prime?(num) 
  return false if num < 2
  return true if num == 2
  (2...num).each do |divisor|
    return false if num % divisor == 0
  end
  true
end

def mersenne_prime(n)
  power = 2
  mersennes = []

  while mersennes.length < n
    num = (2 ** power) - 1
    mersennes << num if is_prime?(num)
    power += 1 
  end

  mersennes.last
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

# triangular_word?
#
# A triangular number is a number of the form (i * (i + 1)) / 2 where i is some
# positive integer. Substituting i with increasing integers gives the
# triangular number sequence. The first five numbers of the triangular number
# sequence are 1, 3, 6, 10, 15.  We can encode a word as a number by taking the
# sum of its letters based on their position in the alphabet. For example, we
# can encode "cat" as 24 because c is the 3rd of the alphabet, a is the 1st,
# and t is the 20th:
#
# 3 + 1 + 20 = 24
#
# Write a method triangular_word? that accepts a word as an argument and
# returns a boolean indicating whether or not that word's number encoding is a
# triangular number. You can assume that the argument contains lowercase
# letters.
# def triangular_word?(word)
#   alphabet = ('a'..'z').to_a
#   encoded_word = word.each_char.inject(0) do |acc, char|
#     index_of_char = alphabet.index(char)
#     acc += index_of_char + 1
#   end
#
#   p encoded_word
#
#   i = 1
#   until i > encoded_word
#     value_to_check = (i * ( i + 1 ) ) / 2
#     return true if value_to_check == encoded_word
#     i += 1
#   end
#
#   false
# end
def triangular_word?(word)
  alphabets = ("a".."z").to_a
  encoded = word.split('').inject(0) do |acc, char|
    acc += alphabets.index(char) + 1
  end

  double_of_encoded = encoded * 2
  sqrt_of_double = Math.sqrt(double_of_encoded).floor
  return true if (sqrt_of_double) * (sqrt_of_double + 1) == encoded * 2
  false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

# consecutive_collapse
# Write a method consecutive_collapse that accepts an array of numbers as an
# argument. The method should return a new array that results from continuously
# removing consecutive numbers that are adjacent in the array. If multiple
# adjacent pairs are consecutive numbers, remove the leftmost pair first. For
# example:

# [3, 4, 1] -> [1]
#
#     because 3 and 4 are consecutive and adjacent numbers, so we can remove
#     them
#
# [1, 4, 3, 7] -> [1, 7]
#
#     because 4 and 3 are consecutive and adjacent numbers, so we can remove
#     them
#
# [3, 4, 5] -> [5]
#
#     because 4 and 3 are consecutive and adjacent numbers, we don't target 4
#     and 5 since we should prefer to remove the leftmost pair
#
# We can apply this rule repeatedly until we cannot collapse the array any
# further:
#
# example 1 [9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]
# example 2 [3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]

def consecutive_collapse(arr)
  arr_to_work = arr.dup
  is_consecutive = false
  until is_consecutive
    is_consecutive = true
    i = 0
    while i < arr_to_work.length - 1
      if arr_to_work[i] + 1 == arr_to_work[i + 1] || arr_to_work[i] - 1 == arr_to_work[i + 1]
        arr_to_work = arr_to_work[0...i] + arr_to_work[i + 2..-1]
        is_consecutive = false
        break
      end
      i += 1
    end
  end
  return arr_to_work
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

# pretentious_primes
#
# Write a method pretentious_primes that takes accepts an array and a number,
# n, as arguments. The method should return a new array where each element of
# the original array is replaced according to the following rules:
#
#     when the number argument is positive, replace an element with the n-th
#     nearest prime number that is greater than the element when the number
#     argument is negative, replace an element with the n-th nearest prime
#     number that is less than the element
#
# For example:
#
#     if element = 7 and n = 1, then the new element should be 11 because 11 is
#     the nearest prime greater than 7 if the element = 7 and n = 2, then the
#     new element should be 13 because 13 is the 2nd nearest prime greater than
#     7 if the element = 7 and n = -1, then the new element should be 5 because
#     5 is the nearest prime less than 7 if the element = 7 and n = -2, then
#     the new element should be 3 because 3 is the 2nd nearest prime less than
#     7
#
# Note that we will always be able to find a prime that is greater than a given
# number because there are an infinite number of primes (this is given by
# Euclid's Theorem). However, we may be unable to find a prime that is smaller
# than a given number, because 2 is the smallest prime. When a smaller prime
# cannot be calculated, replace the element with nil.

## Monkey Patching Integer Method
class Integer
  def is_prime?
    return false if self < 2
    return true if self == 2
    return false if (2...self).any? { |n| self % n == 0 }
    true
  end
end

def get_pretentious_prime(number, rotation)
  primes = []

  if rotation > 0
    i = number + 1
    while primes.length < rotation
      primes << i if i.is_prime?
      i += 1
    end
    primes.last

  else
    length = rotation * -1
    i = number - 1
    while primes.length < length && i >= 2
      primes << i if i.is_prime?
      i -= 1
    end
    return primes.last if primes.length == length
    nil
  end
end

def pretentious_primes(arr, n)
  arr.map do |el|
    get_pretentious_prime(el, n)
  end
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
