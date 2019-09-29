# Write a method reverse(word) that takes in a string
# word and returns the word with its letters in reverse order.


def reverse(word)
  reverse_word = ""
  i = word.length - 1
  while i >= 0
    reverse_word += word[i]
    i -= 1
  end
  reverse_word
end

puts reverse("cat")          # => "tac"
puts reverse("programming")  # => "gnimmargorp"
puts reverse("bootcamp")     # => "pmactoob"
