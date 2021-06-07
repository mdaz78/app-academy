def hipsterfy(word)
  vowel = "aeiou"

  i = word.length - 1
  while i >= 0
    char = word[i]
    if vowel.include?(char)
      word[i] = ""
      return word
    end
    i -= 1
  end

  word
end

def vowel_counts(string)
  vowel = "aeiou"

  vowel_hash = Hash.new(0)

  string.each_char do |ch|
    key = ch.downcase

    if vowel.include?(key)
      vowel_hash[key] += 1
    end
  end

  vowel_hash
end

def caesar_cipher(message, n)
  alphabets = ("a".."z").to_a
  ciphered_text = ""

  message.each_char do |ch|
    index_of_ch = alphabets.index(ch)

    if index_of_ch.nil?
      ciphered_text += ch
    else
      ciphered_index = (index_of_ch + n) % alphabets.length
      ciphered_text += alphabets[ciphered_index]
    end
  end

  ciphered_text
end
