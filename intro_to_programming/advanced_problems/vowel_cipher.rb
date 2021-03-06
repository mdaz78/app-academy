# Write a method vowel_cipher that takes in a string and
# returns a new string where every vowel becomes
# the next vowel in the alphabet.

def vowel_cipher(string)
  vowels = "aeiou"
  encrypted_arr = string.split('').map do |char|
    if vowels.include?(char)
      old_index = vowels.index(char)
      new_index = (old_index + 1) % 5
      vowels[new_index]
    else
      char
    end
  end
  encrypted_arr.join('')
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap