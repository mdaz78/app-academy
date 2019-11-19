def hipsterfy(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      word[i] = ""
      return word
    end
    i -= 1
  end
  word
end

def vowel_counts(sentence)
  vowels_hash = Hash.new(0)
  vowels = ['a', 'e', 'i', 'o', 'u']

  sentence.each_char do |ch|
    if vowels.include?(ch.downcase)
      vowels_hash[ch.downcase] += 1
    end
  end

  vowels_hash
end

def caesar_cipher(message, num)
  alphabets = ('a'..'z').to_a
  ciphered_text = ""

  message.each_char do |char|
    if alphabets.include?(char.downcase)
      index = alphabets.index(char.downcase)
      new_index = (index + num) % 26
      ciphered_char = alphabets[new_index]
      ciphered_text += char.downcase == char ? ciphered_char : ciphered_char.upcase
    else
      ciphered_text += char
    end
  end

  ciphered_text
end