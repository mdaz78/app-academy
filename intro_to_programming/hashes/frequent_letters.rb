# Write a method frequent_letters that takes in a string and
# returns an array containing the characters that appeared
# more than twice in the string.

def frequent_letters(string)
  letters_coming_more_than_twice = []
  letter_hash = Hash.new(0)
  string.each_char do |ch|
    letter_hash[ch] += 1
  end
  letter_hash.each do |k, v|
    if v > 2
      letters_coming_more_than_twice << k
    end
  end
  letters_coming_more_than_twice
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts

