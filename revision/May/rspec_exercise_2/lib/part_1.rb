def partition(arr, n)
  lower_than_n = []
  higher_than_n = []

  arr.each do |el|
    lower_than_n << el if el < n
    higher_than_n << el if el >= n
  end

  [lower_than_n, higher_than_n]
end

def merge(hash_1, hash_2)
  merged_hash = {}

  hash_1.each do |k, v|
    merged_hash[k] = v
  end

  hash_2.each do |k, v|
    merged_hash[k] = v
  end

  merged_hash
end

def replace_vowels_with(word, char = "*")
  vowels = "aeiou"
  masked_word = ""
  i = 0

  while i < word.length
    char = word[i]

    if vowels.include?(char.downcase)
      masked_word += "*"
    else
      masked_word += char
    end
    i += 1
  end

  masked_word
end

def censor(sentence, curse_words)
  words = sentence.split(" ")

  censored_words = words.map do |word|
    if curse_words.include?(word.downcase)
      replace_vowels_with(word)
    else
      word
    end
  end

  censored_sentence = censored_words.join(" ")

  censored_sentence
end

def power_of_two?(n)
  return false if n < 1
  return true if n == 2 || n == 1

  i = 2

  while i <= n
    i *= 2
    return true if i == n
  end

  false
end
