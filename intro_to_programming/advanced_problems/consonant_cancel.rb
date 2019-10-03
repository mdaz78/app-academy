# Write a method consonant_cancel that takes in a sentence and
# returns a new sentence where every word begins with it's first vowel.


def consonant_cancel(sentence)
  word_arr = sentence.split(' ')
  word_starting_with_first_vowel_arr = word_arr.map { |word| remove_consonants_from_beginning(word) }
  word_starting_with_first_vowel_arr.join(" ")
end

def remove_consonants_from_beginning(word)
  vowels = "aeiou"
  word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      return word[idx..-1]
    end
  end
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"