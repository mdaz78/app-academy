# Write a method most_vowels that takes in a sentence
# string and returns the word of the sentence that contains the most vowels.

def most_vowels(sentence)
  sentence_arr = sentence.split(' ')
  num_vowels = sentence_arr.map do |word|
    count_vowels(word)
  end
  max = num_vowels.max
  max_idx = num_vowels.index(max)
  sentence_arr[max_idx]
end

def count_vowels(word)
  counter = 0
  vowels = "aeiou"
  word.each_char do |letter|
    if vowels.include?(letter)
      counter += 1
    end
  end
  counter
end

print most_vowels("what a wonderful life") #=> "wonderful"