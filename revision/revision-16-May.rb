def map_by_name(arr)
  arr.map { |el| el["name"] }
end

# pets = [
#   {"type"=>"dog", "name"=>"Rolo"},
#   {"type"=>"cat", "name"=>"Sunny"},
#   {"type"=>"rat", "name"=>"Saki"},
#   {"type"=>"dog", "name"=>"Finn"},
#   {"type"=>"cat", "name"=>"Buffy"}
# ]
# print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
# puts

# countries = [
#  {"name"=>"Japan", "continent"=>"Asia"},
#  {"name"=>"Hungary", "continent"=>"Europe"},
#  {"name"=>"Kenya", "continent"=>"Africa"},
# ]
# print map_by_name(countries) #=> ["Japan", "Hungary", "Kenya"]
# puts

def map_by_key(arr, key)
  arr.map { |el| el[key] }
end

# locations = [
#   {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
#   {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
#   {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
# ]

# print map_by_key(locations, "state") == ["New York", "California", "Oregon"]
# puts
# print map_by_key(locations, "city") == ["New York City", "San Francisco", "Portland"]
# puts

def yell_sentence(sent)
  upper_array = sent.split(" ").map { |word| word.upcase + "!" }
  upper_array.join(" ")
end

# puts yell_sentence("I have a bad feeling about this") == "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"

def whisper_words(words)
  words.map { |word| word.downcase + "..." }
end

# print whisper_words(["KEEP", "The", "NOISE", "down"]) == ["keep...", "the...", "noise...", "down..."]
# puts

def o_words(sentence)
  sentence.split(" ").select { |word| word.include? "o" }
end

# print o_words("How did you do that?") == ["How", "you", "do"]
# puts

def last_index(str, char)
  i = str.length - 1

  while i >= 0
    if str[i] == char
      return i
    end
    i -= 1
  end

  return -1
end

# puts last_index("abca", "a")       == 3
# puts last_index("mississipi", "i") == 9
# puts last_index("octagon", "o")    == 5
# puts last_index("programming", "m")== 7

def count_vowels(word)
  count = 0

  vowels = "aeiou"
  word.each_char do |ch|
    if vowels.include? ch
      count += 1
    end
  end

  count
end

def most_vowels(sentence)
  words = sentence.split(" ")

  max_vowel_count = 0
  word_with_maximum_vowel = 0

  words.each do |word|
    vowel_count = count_vowels(word)

    if vowel_count > max_vowel_count
      max_vowel_count = vowel_count
      word_with_maximum_vowel = word
    end
  end

  word_with_maximum_vowel
end

# print most_vowels("what a wonderful life") == "wonderful"

def prime?(num)
  return false if num < 2

  (2...num).each do |n|
    return false if num % n == 0
  end

  return true
end

# puts prime?(2)  #=> true
# puts prime?(5)  #=> true
# puts prime?(11) #=> true
# puts prime?(4)  #=> false
# puts prime?(9)  #=> false
# puts prime?(-5) #=> false

def pick_primes(numbers)
  numbers.select { |num| prime?(num) }
end

# print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
# puts
# print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
# puts

def prime_factors(num)
  factors = []

  (1...num).each do |n|
    factors << n if num % n == 0
  end

  pick_primes(factors)
end

# print prime_factors(24) == [2, 3]
# puts
# print prime_factors(60) == [2, 3, 5]
# puts

# Write a method greatest_factor_array that takes in an array of numbers and
# returns a new array where every even number is replaced with it's greatest
# factor. A greatest factor is the largest number that divides another with no
# remainder. For example the greatest factor of 16 is 8. (For the purpose of this
# problem we won't say the greatest factor of 16 is 16, because that would be too
# easy, ha)

def greatest_factor(num)
  factors = []
  (1...num).each do |n|
    factors << n if num % n == 0
  end

  factors.max
end

def greatest_factor_array(arr)
  arr.map do |num|
    if num.even?
      greatest_factor(num)
    else
      num
    end
  end
end

# print greatest_factor_array([16, 7, 9, 14]) == [8, 7, 9, 7]
# puts
# print greatest_factor_array([30, 3, 24, 21, 10]) == [15, 3, 12, 21, 5]
# puts

# Write a method perfect_square? that takes in a number and returns a boolean
# indicating whether it is a perfect square. A perfect square is a number that
# results from multiplying a number by itself. For example, 9 is a perfect square
# because 3  3 = 9, 25 is a perfect square because 5  5 = 25.

def perfect_square?(num)
  (1...num).each do |n|
    return true if n * n == num
  end

  false
end

# puts perfect_square?(5)   #=> false
# puts perfect_square?(12)  #=> false
# puts perfect_square?(30)  #=> false
# puts perfect_square?(9)   #=> true
# puts perfect_square?(25)  #=> true

def triple_sequence(start, length)
  sequence = [start]

  while sequence.length != length
    last_elem_in_sequence = sequence.last
    sequence << last_elem_in_sequence * 3
  end

  sequence
end

# print triple_sequence(2, 4) # => [2, 6, 18, 54]
# puts
# print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
# puts

def summation(n)
  (n * (n + 1)) / 2
end

def summation_sequence(start, length)
  sequence = [start]

  while sequence.length != length
    last_elem_in_sequence = sequence.last
    sequence << summation(last_elem_in_sequence)
  end
  sequence
end

# print summation_sequence(3, 4) # => [3, 6, 21, 231]
# print summation_sequence(5, 3) # => [5, 15, 120]

# The fibonacci sequence is a sequence of numbers whose first and second elements
# are 1. To generate further elements of the sequence we take the sum of the
# previous two elements. For example the first 6 fibonacci numbers are 1, 1, 2, 3,
# 5, 8. Write a method fibonacci that takes in a number length and returns the
# fibonacci sequence up to the given length.

def fibonacci(length)
  fib_sequence = []

  return fib_sequence if length == 0
  return fib_sequence << 1 if length == 1 || length == 2

  fib_sequence.push(1, 1)

  # i is 2 because fib_sequence already contains 2 elements
  i = 2

  while i < length
    last_element = fib_sequence[-1]
    second_to_last_element = fib_sequence[-2]

    element_to_insert = last_element + second_to_last_element

    fib_sequence << element_to_insert

    i += 1
  end

  fib_sequence
end

# print fibonacci(0)  == []
# puts
# print fibonacci(1) == [1]
# puts
# print fibonacci(2) == [1]
# puts
# print fibonacci(6) == [1, 1, 2, 3, 5, 8]
# puts
# print fibonacci(8) == [1, 1, 2, 3, 5, 8, 13, 21]
# puts

# Write a method caesar_cipher that takes in a string and a number. The method
# should return a new string where every character of the original is shifted num
# characters in the alphabet.

ALPHABETS = "abcdefghijklmnopqrstuvwxyz"

def is_alphabet?(char)
  ALPHABETS.include?(char)
end

def cipher(char, num)
  current_index = ALPHABETS.index(char.downcase)
  ciphered_index = (current_index + num) % 26

  return ALPHABETS[ciphered_index].upcase if char.upcase == char
  return ALPHABETS[ciphered_index] if ALPHABETS.include?(char)
end

def caesar_cipher(str, num)
  ciphered_chars = str.split("").map do |char|
    if is_alphabet?(char.downcase)
      cipher(char, num)
    else
      char
    end
  end
  ciphered_word = ciphered_chars.join("")

  ciphered_word
end

# puts caesar_cipher("apple", 1)    == "bqqmf"
# puts caesar_cipher("Apple", 1)    == "Bqqmf"
# puts caesar_cipher("bootcamp", 2) == "dqqvecor"
# puts caesar_cipher("zebra", 4)    == "difve"
# puts caesar_cipher("apple Apple ", 1)    == "bqqmf Bqqmf "

# Write a method vowel_cipher that takes in a string and returns a new string
# where every vowel becomes the next vowel in the alphabet.

VOWELS = "aeiou"

def cipher_vowel_char(char)
  current_index = VOWELS.index(char.downcase)
  ciphered_index = (current_index + 1) % 5

  return VOWELS[ciphered_index].upcase if char.upcase == char

  return VOWELS[ciphered_index]
end

def is_vowel?(char)
  VOWELS.include?(char)
end

def vowel_cipher(string)
  ciphered_chars = string.split("").map do |char|
    if is_alphabet?(char) && is_vowel?(char)
      cipher_vowel_char(char)
    else
      char
    end
  end

  ciphered_word = ciphered_chars.join("")

  ciphered_word
end

# puts vowel_cipher("bootcamp") == "buutcemp"
# puts vowel_cipher("paper cup") == "pepir cap"
# puts vowel_cipher("you") == "yua"

# Write a method that takes in a string and returns the number of times that the
# same letter repeats twice in a row.
def double_letter_count(string)
  pair_count = 0

  string.each_char.with_index do |char, index|
    pair_count += 1 if char == string[index + 1]
  end

  pair_count
end

# puts double_letter_count("the jeep rolled down the hill") #=> 3
# puts double_letter_count("bootcamp") #=> 1

# Write a method adjacent_sum that takes in an array of numbers and returns a new
# array containing the sums of adjacent numbers in the original array. See the
# examples.
def adjacent_sum(arr)
  sums = []
  i = 0

  while i < arr.length - 1
    sum = arr[i] + arr[i + 1]
    sums << sum
    i += 1
  end

  sums
end

# print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
# puts
# print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
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
  pyramid = [base]

  while base.length != pyramid.length
    last_base = pyramid.first
    sum = adjacent_sum(last_base)
    pyramid.unshift(sum)
  end

  pyramid
end

# print pyramid_sum([1, 4, 6]) == [[15], [5, 10], [1, 4, 6]]
# puts

# print pyramid_sum([3, 7, 2, 11]) == [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
# puts

# Write a method all_else_equal that takes in an array of numbers. The method
# should return the element of the array that is equal to half of the sum of all
# elements of the array. If there is no such element, the method should return
# nil.

def all_else_equal(arr)
  sum = arr.sum
  half_of_sum = sum / 2

  return half_of_sum if arr.include?(half_of_sum)
  nil
end

# p all_else_equal([2, 4, 3, 10, 1]) == 10  #=> 10, because the sum of all elements is 20
# p all_else_equal([6, 3, 5, -9, 1]) == 3   #=> 3, because the sum of all elements is 6
# p all_else_equal([1, 2, 3, 4]) == nil     #=> nil, because the sum of all elements is 10 and there is no 5 in the array

# Write a method anagrams? that takes in two words and returns a boolean
# indicating whether or not the words are anagrams. Anagrams are words that
# contain the same characters but not necessarily in the same order. Solve this
# without using .sort

def create_hash_of_letter_count(word)
  hash = Hash.new(0)
  word.each_char { |ch| hash[ch] += 1 }
  hash
end

def anagrams?(word1, word2)
  return false if word1.length != word2.length

  create_hash_of_letter_count(word1) == create_hash_of_letter_count(word2)
end

# puts anagrams?("cat", "act")          #=> true
# puts anagrams?("restful", "fluster")  #=> true
# puts anagrams?("cat", "dog")          #=> false
# puts anagrams?("boot", "bootcamp")    #=> false

# Write a method consonant_cancel that takes in a sentence and returns a new
# sentence where every word begins with it's first vowel.
def get_index_of_first_vowel(word)
  word.each_char.with_index do |char, index|
    return index if VOWELS.include?(char)
  end

  -1
end

def consonant_cancel(sentence)
  consonant_cancelled_words = sentence.split(" ").map do |word|
    index_of_first_vowel = get_index_of_first_vowel(word)
    word[index_of_first_vowel..-1]
  end
  consonant_cancelled_words.join(" ")
end

# puts consonant_cancel("down the rabbit hole") == "own e abbit ole"
# puts consonant_cancel("writing code is challenging") == "iting ode is allenging"

# Write a method same_char_collapse that takes in a string and returns a
# collapsed version of the string. To collapse the string, we repeatedly delete
# 2 adjacent characters that are the same until there are no such adjacent
# characters. If there are multiple pairs that can be collapsed, delete the
# leftmost pair. For example, we take the following steps to collapse
# "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy

def collapse(str)
  chars = str.split("")
  result = nil
  i = 0

  while i < chars.length
    if chars[i] == chars[i + 1]
      chars[i] = ""
      chars[i + 1] = ""

      return chars.join("")
    end
    i += 1
  end

  return str if result.nil?
end

def same_char_collapse(str)
  collapsible = true
  collapsed_str = nil

  while collapsible
    collapsible = false
    collapsed_str = collapse(str)

    if collapsed_str != str
      collapsible = true
      str = collapsed_str
    end
  end

  collapsed_str
end

puts same_char_collapse("zzzxaaxy") == "zy"
# # because zzzxaaxy -> zxaaxy -> zxxy -> zy

puts same_char_collapse("uqrrqvtt") == "uv"
# # because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
