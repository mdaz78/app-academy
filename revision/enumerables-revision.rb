# Intro to programming

#######################
##### Enumerables #####
#######################

# Write a method to_initials that takes in a person's name string and
# returns a string representing their initials.
def to_initials(name)
  name.split(" ").map { |str| str[0].upcase }.join("")
end

# puts to_initials("Kelvin Bridges")      # => "KB"
# puts to_initials("Michaela Yamamoto")   # => "MY"
# puts to_initials("Mary La Grange")      # => "MLG"

# Write a method first_in_array that takes in an array and two elements, the
# method should return the element that appears earlier in the array.
def first_in_array(arr, elem1, elem2)
  positionOfFirstElement = arr.index(elem1)
  positionOfSecondElement = arr.index(elem2)

  positionOfFirstElement < positionOfSecondElement ? elem1 : elem2
end

# puts first_in_array(["a", "b", "c", "d"], "d", "b");  # => "b"
# puts first_in_array(["cat", "bird", "dog", "mouse"], "dog", "mouse") # => "dog"

# Write a method abbreviate_sentence that takes in a sentence string and
# returns a new sentence where every word longer than 4 characters has all of
# it's vowels removed.
def abbreviate_sentence(sentence)
  sentence.split(" ").map { |word| word.length > 4 ? remove_vowel_from(word) : word }.join(" ")
end

VOWELS = ["a", "e", "i", "o", "u"]

def remove_vowel_from(word)
  charsWithVowelsRemoved = word.split("").map do |char|
    unless VOWELS.include?(char)
      char
    else
      ""
    end
  end

  charsWithVowelsRemoved.join("")
end

# puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
# puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

# Write a method format_name that takes in a name string and returns the name
# properly capitalized.

def format_name(name)
  name.split(" ").map do |word|
    lowercase_chars = word.downcase
    first_char = lowercase_chars[0].upcase
    first_char + lowercase_chars[1..-1]
  end.join(" ")
end

# puts format_name("chase WILSON") # => "Chase Wilson"
# puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"

# Write a method is_valid_name that takes in a string and returns a boolean
# indicating whether or not it is a valid name.
# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(name)
  splited_name = name.split(" ")
  return false if splited_name.length < 2
  return false if name != format_name(name)

  true
end

# puts is_valid_name("Kush Patel")       # => true
# puts is_valid_name("Daniel")           # => false
# puts is_valid_name("Robert Downey Jr") # => true
# puts is_valid_name("ROBERT DOWNEY JR") # => false

# Write a method is_valid_email that takes in a string and returns a boolean
# indicating whether or not it is a valid email address.
# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_name_valid?(name)
  alphabets = "abcdefghijklmnopqrstuvwxyz"
  name.split("").all? { |char| alphabets.include? char }
end

def is_domain_valid?(domain)
  domain.split(".").length == 2
end

def is_valid_email(email)
  name_and_domain = email.split("@")
  return false if name_and_domain.length != 2
  name, domain = name_and_domain

  is_name_valid?(name) && is_domain_valid?(domain)
end

# puts is_valid_email("abc@xy.z")         # => true
# puts is_valid_email("jdoe@gmail.com")   # => true
# puts is_valid_email("jdoe@g@mail.com")  # => false
# puts is_valid_email("jdoe42@gmail.com") # => false
# puts is_valid_email("jdoegmail.com")    # => false
# puts is_valid_email("az@email")         # => false

# Write a method reverse_words that takes in a sentence string and returns the
# sentence with the order of the characters in each word reversed. Note that we
# need to reverse the order of characters in the words, do not reverse the
# order of words in the sentence.
def reverse_words(sentence)
  sentence.split(" ").map { |word| word.reverse }.join(" ")
end

# puts reverse_words("keep coding") # => 'peek gnidoc'
# puts reverse_words("simplicity is prerequisite for reliability") # => 'yticilpmis si etisiuqererp rof ytilibailer'

# Write a method rotate_array that takes in an array and a number. The method
# should return the array after rotating the elements the specified number of
# times. A single rotation takes the last element of the array and moves it to
# the front.

def rotate_array(array, rotation_value)
  duplicate_array = array.dup

  while rotation_value != 0
    last_element = duplicate_array.pop
    duplicate_array.unshift(last_element)
    rotation_value -= 1
  end

  duplicate_array
end

# print rotate_array(["Matt", "Danny", "Mashu", "Matthias"], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
# puts

# print rotate_array(["a", "b", "c", "d"], 2) # => [ "c", "d", "a", "b" ]
# puts
