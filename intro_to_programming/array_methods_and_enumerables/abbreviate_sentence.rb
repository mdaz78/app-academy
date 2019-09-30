# Write a method abbreviate_sentence that takes in a
# sentence string and returns a new sentence where
# every word longer than 4 characters has all of it's vowels removed.


def abbreviate_sentence(sent)
  abbreviated_sentence_arr = []
  sent.split(' ').each do |word|
    if word.length > 4
      abbreviated_sentence_arr << remove_vowels(word)
    else
      abbreviated_sentence_arr << word
    end
  end

  abbreviated_sentence_arr.join(' ')
end

def remove_vowels(word)
  word_without_vowels = ""
  vowels = ['a', 'e', 'i', 'o', 'u']
  word.each_char do |letter|
    unless vowels.include?(letter)
      word_without_vowels += letter
    end
  end
  word_without_vowels
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

