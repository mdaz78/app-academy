# Write a method count_e(word) that takes in a 
# string word and returns the number of e's in the word

def count_e(word)
  number_of_e = 0
  i = 0
  while i < word.length
    if word[i].downcase == 'e'
      number_of_e += 1
    end
    i += 1
  end
  number_of_e
end


puts count_e("movie") # => 1
puts count_e("excellent") # => 3
