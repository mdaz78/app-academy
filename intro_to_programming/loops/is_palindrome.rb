# Write a method is_palindrome(word) that takes in a
# string word and returns the true if the word is
# a palindrome, false otherwise. A palindrome is
# a word that is spelled the same forwards and backwards.


def is_palindrome(word)
  word == reverse(word)
end

def reverse(word)
  counter = word.length - 1
  result = ''
  while counter >= 0
    result += word[counter]
    counter -= 1
  end
  result
end

puts is_palindrome('racecar')  # => true
puts is_palindrome('kayak')    # => true
puts is_palindrome('bootcamp') # => false
