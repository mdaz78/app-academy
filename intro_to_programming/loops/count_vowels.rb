# Write a method, count_vowels(word), that takes
# in a string word and returns the number of
# vowels in the word. Vowels are the letters a, e, i, o, u.

def count_vowels(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  vowel_count = 0
  i = 0
  while i < word.length
    if vowels.include?(word[i])
      vowel_count += 1
    end
    i += 1
  end
  vowel_count
end

puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2

