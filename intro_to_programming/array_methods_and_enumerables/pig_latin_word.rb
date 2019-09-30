# Write a method pig_latin_word that takes in a
# word string and translates the word into pig latin.

# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters
# before the first vowel to the end of the word and add 'ay'

def pig_latin_word(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  first_char = word[0]
  result = ""
  if vowels.include?(first_char)
    result = word + "yay"
  else
    i = 0
    index_of_first_vowel = 0
    while i < word.length
      if vowels.include?(word[i])
        index_of_first_vowel = i
        break;
      end
      i += 1
    end

    result = word[i..-1] + word[0...i] + "ay"
  end
end

puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"

