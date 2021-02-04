# Intro to programming

######################################
##### Nested Loops and 2D Arrays #####
######################################

# Write a method combinations that takes in an array of unique elements, the
# method should return a 2D array representing all possible combinations of 2
# elements of the array.

# print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
# puts

# print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
# puts

# Write a method opposite_count that takes in an array of unique numbers. The
# method should return the number of pairs of elements that sum to 0.

# puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
# puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1

# Write a method two_d_Sum that takes in a two dimensional array and returns
# the sum of all elements in the array.

# array_1 = [
#   [4, 5],
#   [1, 3, 7, 1]
# ]
# puts two_d_sum(array_1)    # => 21

# array_2 = [
#   [3, 3],
#   [2],
#   [2, 5]
# ]
# puts two_d_sum(array_2)    # => 15

# Write a method two_d_translate that takes in a 2 dimensional array and
# translates it into a 1 dimensional array. You can assume that the inner
# arrays always have 2 elements. See the examples.

# arr_1 = [
#   ['boot', 3],
#   ['camp', 2],
#   ['program', 0]
# ]

# print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
# puts

# arr_2 = [
#   ['red', 1],
#   ['blue', 4]
# ]

# print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
# puts

# Write a method array_translate that takes in an array whose elements
# alternate between words and numbers. The method should return a string where
# each word is repeated the number of times that immediately follows in the
# array.

# print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
# puts

# print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
# puts

# Write a method pig_latin_word that takes in a word string and translates the
# word into pig latin.

# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first
#   vowel to the end of the word and add 'ay'

# puts pig_latin_word("apple")   # => "appleyay"
# puts pig_latin_word("eat")     # => "eatyay"
# puts pig_latin_word("banana")  # => "ananabay"
# puts pig_latin_word("trash")   # => "ashtray"
