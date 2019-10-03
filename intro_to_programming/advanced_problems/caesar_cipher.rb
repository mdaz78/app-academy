# Write a method caesar_cipher that takes in a string and a number.
# The method should return a new string where every character of
# the original is shifted num characters in the alphabet.

# Feel free to use this variable:
# alphabet = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  encrypted = ""
  str.each_char do |ch|
    index_of_ch = alphabet.index(ch)
    encrypted_idx = (index_of_ch + num) % 26
    encrypted += alphabet[encrypted_idx]
  end
  encrypted
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"