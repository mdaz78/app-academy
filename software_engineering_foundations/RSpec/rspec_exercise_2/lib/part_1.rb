def partition(arr, num)
  elements_less_than_num = arr.select { |n| n < num }
  elements_greater_than_num = arr.select { |n| n >= num }
  [ elements_less_than_num, elements_greater_than_num ]
end


def merge(hash_1, hash_2)
  merged_hash = {}
  hash_1.each { |k, v| merged_hash[k] = v }
  hash_2.each { |k, v| merged_hash[k] = v }
  merged_hash
end


def censor(sentence, curse_words)
  words = sentence.split(' ')
  censored_words = words.map do |word|
    if curse_words.include?(word.downcase)
      censor_word(word)
    else
      word
    end
  end

  censored_words.join(' ')

end

def censor_word(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  censored_word = ""
  word.each_char do |ch|
    if vowels.include?(ch.downcase)
      censored_word += "*"
    else
      censored_word += ch
    end
  end

  censored_word
end


def power_of_two?(num)
  power = 0
  base = 2
  base_raised_to_power = 0
  while base_raised_to_power <= num
    base_raised_to_power = base ** power
    if base_raised_to_power == num
      return true
    end
    power += 1
  end
  false
end