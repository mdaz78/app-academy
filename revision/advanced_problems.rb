# Write a method map_by_name that takes in an array of hashes and returns a new
# array containing the names of each hash.
def map_by_name(arr)
  arr.map { |hash| hash["name"] }
end

# pets = [
#   { "type" => "dog", "name" => "Rolo" },
#   { "type" => "cat", "name" => "Sunny" },
#   { "type" => "rat", "name" => "Saki" },
#   { "type" => "dog", "name" => "Finn" },
#   { "type" => "cat", "name" => "Buffy" },
# ]
# print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
# puts

# countries = [
#   { "name" => "Japan", "continent" => "Asia" },
#   { "name" => "Hungary", "continent" => "Europe" },
#   { "name" => "Kenya", "continent" => "Africa" },
# ]
# print map_by_name(countries) #=> ["Japan", "Hungary", "Kenya"]
# puts

# Write a method map_by_key that takes in an array of hashes and a key string.
# The method should returns a new array containing the values from each hash
# for the given key.
def map_by_key(arr, key)
  arr.map { |hash| hash[key] }
end

# locations = [
#   { "city" => "New York City", "state" => "New York", "coast" => "East" },
#   { "city" => "San Francisco", "state" => "California", "coast" => "West" },
#   { "city" => "Portland", "state" => "Oregon", "coast" => "West" },
# ]

# print map_by_key(locations, "state") #=> ["New York", "California", "Oregon"]
# puts
# print map_by_key(locations, "city") #=> ["New York City", "San Francisco", "Portland"]
# puts

# Write a method yell_sentence that takes in a sentence string and returns a
# new sentence where every word is yelled. See the examples. Use map to solve
# this.
def yell_sentence(sentence)
  sentence.split(" ").map { |word| word.upcase + "!" }.join(" ")
end

# puts yell_sentence("I have a bad feeling about this")
# # => "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"

# Write a method whisper_words that takes in an array of words and returns a
# new array containing a whispered version of each word. See the examples.
# Solve this using map :).
def whisper_words(words)
  words.map { |word| word.downcase + "..." }
end

# print whisper_words(["KEEP", "The", "NOISE", "down"]) # => ["keep...", "the...", "noise...", "down..."]
# puts

# Write a method o_words that takes in a sentence string and returns an array
# of the words that contain an "o". Use select in your solution!
def o_words(sentence)
  sentence.split(" ").select { |word| word.include?("o") }
end

# print o_words("How did you do that?") #=> ["How", "you", "do"]
# puts

# Write a method last_index that takes in a string and a character. The method
# should return the last index where the character can be found in the string.
def last_index(str, char)
  i = str.length - 1

  while i >= 0
    return i if char == str[i]
    i -= 1
  end

  return -1
end

# puts last_index("abca", "a")       #=> 3
# puts last_index("mississipi", "i") #=> 9
# puts last_index("octagon", "o")    #=> 5
# puts last_index("programming", "m") #=> 7

# Write a method most_vowels that takes in a sentence string and returns the
# word of the sentence that contains the most vowels.

def most_vowels(sentence)
  sentence.split(" ").reduce() do |result, word|
    if result.length > word.length
      result
    else
      word
    end
  end
end

# print most_vowels("what a wonderful life") #=> "wonderful"

# Write a method prime? that takes in a number and returns a boolean,
# indicating whether the number is prime. A prime number is only divisible by 1
# and itself.

def prime?(num)
  return false if num <= 1
  (2...num).to_a.each { |n| return false if num % n == 0 }
  return true
end

# puts prime?(2)  #=> true
# puts prime?(5)  #=> true
# puts prime?(11) #=> true
# puts prime?(4)  #=> false
# puts prime?(9)  #=> false
# puts prime?(-5) #=> false

# Write a method pick_primes that takes in an array of numbers and returns a
# new array containing only the prime numbers.

def pick_primes(numbers)
  numbers.select { |n| prime?(n) }
end

# print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
# puts
# print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
# puts

# Write a method prime_factors that takes in a number and returns an array
# containing all of the prime factors of the given number.

def prime_factors(num)
  factors = []
  (1..num).to_a.each { |n| factors << n if num % n == 0 }

  pick_primes(factors)
end

# print prime_factors(24) #=> [2, 3]
# puts
# print prime_factors(60) #=> [2, 3, 5]
# puts

# Write a method greatest_factor_array that takes in an array of numbers and
# returns a new array where every even number is replaced with it's greatest
# factor. A greatest factor is the largest number that divides another with no
# remainder. For example the greatest factor of 16 is 8. (For the purpose of
# this problem we won't say the greatest factor of 16 is 16, because that would
# be too easy, ha)

def greatest_factor_array(arr)
  arr.map do |num|
    if num.odd?
      num
    else
      get_factors(num).max
    end
  end
end

def get_factors(num)
  factors = []
  (1...num).each { |n| factors << n if num % n == 0 }
  factors
end

# print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
# puts
# print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
# puts

# Write a method perfect_square? that takes in a number and returns a boolean
# indicating whether it is a perfect square. A perfect square is a number that
# results from multiplying a number by itself. For example, 9 is a perfect
# square because 3 3 = 9, 25 is a perfect square because 5 5 = 25.

def perfect_square?(num)
  upper_limit = (num / 2.0).ceil
  (1..upper_limit).each { |n| return true if n * n == num }
  false
end

# puts perfect_square?(5)   #=> false
# puts perfect_square?(12)  #=> false
# puts perfect_square?(30)  #=> false
# puts perfect_square?(9)   #=> true
# puts perfect_square?(25)  #=> true

# Write a method triple_sequence that takes in two numbers, start and length.
# The method should return an array representing a sequence that begins with
# start and is length elements long. In the sequence, every element should be 3
# times the previous element. Assume that the length is at least 1.

def triple_sequence(start, length)
  sequence = [start]

  (length - 1).times do
    sequence << sequence[sequence.length - 1] * 3
  end

  sequence
end

# print triple_sequence(2, 4) # => [2, 6, 18, 54]
# puts
# print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
# puts

# A number's summation is the sum of all positive numbers less than or equal to
# the number. For example: the summation of 3 is 6 because 1 + 2 + 3 = 6, the
# summation of 6 is 21 because 1 + 2 + 3 + 4 + 5 + 6 = 21. Write a method
# summation_sequence that takes in a two numbers: start and length. The method
# should return an array containing length total elements. The first number of
# the sequence should be the start number. At any point, to generate the next
# element of the sequence we take the summation of the previous element. You
# can assume that length is not zero.

def summation_sequence(start, length)
  sequence = [start]

  (length - 1).times do
    n = sequence[sequence.length - 1]
    next_element_in_sequence = (n * (n + 1)) / 2
    sequence << next_element_in_sequence
  end

  sequence
end

# print summation_sequence(3, 4) # => [3, 6, 21, 231]
# puts
# print summation_sequence(5, 3) # => [5, 15, 120]
# puts

# The fibonacci sequence is a sequence of numbers whose first and second
# elements are 1. To generate further elements of the sequence we take the sum
# of the previous two elements. For example the first 6 fibonacci numbers are
# 1, 1, 2, 3, 5, 8. Write a method fibonacci that takes in a number length and
# returns the fibonacci sequence up to the given length.

def fibonacci(length)
  return [] if length == 0

  fib_sequence = [1, 1]

  return [fib_sequence[0]] << 1 if length == 1
  return fib_sequence if length == 2

  i = 0
  while i < length - 2
    first_num = fib_sequence[i]
    second_num = fib_sequence[i + 1]

    fib_sequence << first_num + second_num

    i += 1
  end

  fib_sequence
end

# print fibonacci(0) # => []
# puts
# print fibonacci(1) # => [1]
# puts
# print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
# puts
# print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
# puts

# Write a method caesar_cipher that takes in a string and a number. The method
# should return a new string where every character of the original is shifted
# num characters in the alphabet.

ALPHABETS = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)
  encrypted_str = ""

  str.each_char do |ch|
    current_char_position = ALPHABETS.index(ch)
    encrypted_position = (current_char_position + num) % 26
    encrypted_str += ALPHABETS[encrypted_position]
  end

  encrypted_str
end

# puts caesar_cipher("apple", 1)    #=> "bqqmf"
# puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
# puts caesar_cipher("zebra", 4)    #=> "difve"

# Write a method vowel_cipher that takes in a string and returns a new string
# where every vowel becomes the next vowel in the alphabet.

VOWELS = "aeiou"

def vowel_cipher(string)
  encrypted_str = ""

  string.each_char do |ch|
    if (VOWELS.include?(ch))
      current_vowel_position = VOWELS.index(ch)
      encrypted_position = (current_vowel_position + 1) % 5
      encrypted_char = VOWELS[encrypted_position]
      encrypted_str += encrypted_char
    else
      encrypted_str += ch
    end
  end

  encrypted_str
end

# puts vowel_cipher("bootcamp") == "buutcemp"
# puts vowel_cipher("paper cup") == "pepir cap"

# Write a method that takes in a string and returns the number of times that
# the same letter repeats twice in a row.

def double_letter_count(string)
  i = 0
  double_count = 0

  while i < string.length
    if string[i] == string[i + 1]
      double_count += 1
      i += 2
    else
      i += 1
    end
  end

  double_count
end

# puts double_letter_count("the jeep rolled down the hill") == 3
# puts double_letter_count("bootcamp") == 1
# puts double_letter_count("boootcamp") == 1

# Write a method adjacent_sum that takes in an array of numbers and returns a
# new array containing the sums of adjacent numbers in the original array. See
# the examples.

def adjacent_sum(arr)
  i = 0
  sums = []

  while i < arr.length - 1
    sum = arr[i] + arr[i + 1]
    sums << sum
    i += 1
  end

  sums
end

# print adjacent_sum([3, 7, 2, 11]) == [10, 9, 13] #=> because [ 3+7, 7+2, 2+11 ]
# puts
# print adjacent_sum([2, 5, 1, 9, 2, 4]) == [7, 6, 10, 11, 6] #=> because [2+5, 5+1, 1+9, 9+2, 2+4]
# puts

# Write a method pyramid_sum that takes in an array of numbers representing the
# base of a pyramid. The function should return a 2D array representing a
# complete pyramid with the given base. To construct a level of the pyramid, we
# take the sum of adjacent elements of the level below.

# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  sums_arr = [base]

  (base.length - 1).times do
    element_to_sum = sums_arr[0]
    sum = adjacent_sum(element_to_sum)
    sums_arr.unshift(sum)
  end

  sums_arr
end

# print pyramid_sum([1, 4, 6]) == [[15], [5, 10], [1, 4, 6]]
# puts

# print pyramid_sum([3, 7, 2, 11]) == [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
# puts

# Write a method all_else_equal that takes in an array of numbers. The method
# should return the element of the array that is equal to half of the sum of
# all elements of the array. If there is no such element, the method should
# return nil.

def all_else_equal(arr)
  sum = arr.sum
  half_of_sum = sum / 2
  index_of_sum = arr.index(half_of_sum)
  index_of_sum ? arr[index_of_sum] : nil
end

# p all_else_equal([2, 4, 3, 10, 1]) == 10 #=> because the sum of all elements is 20
# p all_else_equal([6, 3, 5, -9, 1]) == 3 #=>because the sum of all elements is 6
# p all_else_equal([1, 2, 3, 4]) == nil #=> because the sum of all elements is 10 and there is no 5 in the array

# Write a method anagrams? that takes in two words and returns a boolean
# indicating whether or not the words are anagrams. Anagrams are words that
# contain the same characters but not necessarily in the same order. Solve this
# without using .sort

def anagrams?(word1, word2)
  return false if word1.length != word2.length

  word1_hash = Hash.new(0)
  word2_hash = Hash.new(0)

  word1.each_char { |ch| word1_hash[ch] += 1 }
  word2.each_char { |ch| word2_hash[ch] += 1 }

  word1_hash == word2_hash
end

# puts anagrams?("cat", "act") == true
# puts anagrams?("restful", "fluster") == true
# puts anagrams?("cat", "dog") == false
# puts anagrams?("boot", "bootcamp") == false

# Write a method consonant_cancel that takes in a sentence and returns a new
# sentence where every word begins with it's first vowel.

def get_index_of_first_vowel_in_a_word(word)
  vowels = "aeiou"
  word.each_char.with_index do |ch, index|
    return index if vowels.include?(ch)
  end

  return -1
end

def get_word_beginning_with_vowel(word)
  index_of_first_vowel = get_index_of_first_vowel_in_a_word(word)
  word[index_of_first_vowel..-1]
end

# puts get_word_beginning_with_vowel("down") == "own"
# puts get_word_beginning_with_vowel("the") == "e"

def consonant_cancel(sentence)
  sentence.split(" ").map { |word| get_word_beginning_with_vowel(word) }.join(" ")
end

# puts consonant_cancel("down the rabbit hole") == "own e abbit ole"
# puts consonant_cancel("writing code is challenging") == "iting ode is allenging"

# Write a method same_char_collapse that takes in a string and returns a
# collapsed version of the string. To collapse the string, we repeatedly delete
# 2 adjacent characters that are the same until there are no such adjacent
# characters. If there are multiple pairs that can be collapsed, delete the
# leftmost pair. For example, we take the following steps to collapse
# "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy

def first_pair_collapse(str)
  arr = str.split("")

  i = 0
  while i < arr.length + 1
    if (arr[i] == arr[i + 1])
      arr[i] = ""
      arr[i + 1] = ""

      return arr.join("")
    end

    i += 1
  end

  str_copy
end

def same_char_collapse(str)
  copy_of_str = str.dup
  collapsed = false

  while !collapsed
    collapsed_str = first_pair_collapse(copy_of_str)

    if (collapsed_str == copy_of_str)
      return collapsed_str
    else
      copy_of_str = collapsed_str
      collapsed_str = false
    end
  end

  copy_of_str
end

puts same_char_collapse("zzzxaaxy") == "zy"
# # because zzzxaaxy -> zxaaxy -> zxxy -> zy

puts same_char_collapse("uqrssrqvtt") == "uv"
# # because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
