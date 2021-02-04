# Intro to programming

#######################
##### Enumerables #####
#######################

# Write a method to_initials that takes in a person's name string and
# returns a string representing their initials.

# puts to_initials("Kelvin Bridges")      # => "KB"
# puts to_initials("Michaela Yamamoto")   # => "MY"
# puts to_initials("Mary La Grange")      # => "MLG"

# Write a method first_in_array that takes in an array and two elements, the
# method should return the element that appears earlier in the array.

# puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
# puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"

# Write a method abbreviate_sentence that takes in a sentence string and
# returns a new sentence where every word longer than 4 characters has all of
# it's vowels removed.

# puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
# puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

# Write a method format_name that takes in a name string and returns the name
# properly capitalized.

# puts format_name("chase WILSON") # => "Chase Wilson"
# puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"

# Write a method is_valid_name that takes in a string and returns a boolean
# indicating whether or not it is a valid name.

# puts is_valid_name("Kush Patel")       # => true
# puts is_valid_name("Daniel")           # => false
# puts is_valid_name("Robert Downey Jr") # => true
# puts is_valid_name("ROBERT DOWNEY JR") # => false

# Write a method is_valid_email that takes in a string and returns a boolean
# indicating whether or not it is a valid email address.

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

# puts reverse_words('keep coding') # => 'peek gnidoc'
# puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'

# Write a method rotate_array that takes in an array and a number. The method
# should return the array after rotating the elements the specified number of
# times. A single rotation takes the last element of the array and moves it to
# the front.

# print rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
# puts

# print rotate_array([ "a", "b", "c", "d" ], 2) # => [ "c", "d", "a", "b" ]
# puts
