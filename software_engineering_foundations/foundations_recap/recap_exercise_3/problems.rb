def no_dupes?(arr)
  count = Hash.new(0)
  arr.each { |el| count[el] += 1 }
  count.keys.select { |el| count[el] == 1 }
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  (0...arr.length - 1).each do |i|
    return false if arr[i] == arr[i + 1]
  end
  true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  indices_hash = Hash.new() { |h, k| h[k] = [] }
  str.each_char.with_index do |ch, i|
    indices_hash[ch] << i
  end
  indices_hash
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  streak_hash = Hash.new(0)
  str.each_char do |char|
    streak_hash[char] += 1
  end

  sorted_streak_hash = streak_hash.sort_by { |k, v| v }
  char, occurrences = sorted_streak_hash.last

  streak = ""
  (0...occurrences).each { |_| streak += char }
  streak
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
  factors = []
  (2...num).each do |divisor|
    factors << divisor if num % divisor == 0
  end
  factors.all? { |factor| is_prime?(factor) }
end

def is_prime?(num)
  return false if num < 2
  (2...num).each { |n| return false if num % n == 0 }
  true
end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
  ciphered_message = ""
  alphabets = ("a".."z").to_a
  key_length = keys.length
  message.each_char.with_index do |char, index|
    key = keys[index % key_length]
    index_of_char_in_alphabets = alphabets.index(char)
    ciphered_index = (key + index_of_char_in_alphabets) % 26
    ciphered_message += alphabets[ciphered_index]
  end
  ciphered_message
end

# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# def vowel_rotate(str)
#   vowels = ['a', 'e', 'i', 'o', 'u']

#   # get the last vowel
#   last_vowel = ''
#   i = str.length - 1
#   while i >= 0
#     if vowels.include?(str[i].downcase)
#       last_vowel = str[i]
#       break
#     end
#     i -= 1
#   end

#   rotated = ""
#   previous_vowel = ""
#   str.each_char do |ch|
#     if vowels.include?(ch)
#       rotated << last_vowel if previous_vowel.empty?
#       rotated << previous_vowel
#       previous_vowel = ch
#     else
#       rotated << ch
#     end
#   end

#   rotated

# end

def vowel_rotate(str)
  vowels = "aeiou"
  vowel_indices = (0...str.length).select { |i| vowels.include?(str[i].downcase) }
  new_vowel_indices = vowel_indices.rotate(-1)
  new_str = str[0..-1]

  new_vowel_indices.each_with_index do |vowel_index, i|
    new_vowel = str[vowel_index]
    new_str[vowel_indices[i]] = new_vowel
  end

  new_str
end

# Examples
p vowel_rotate("computer")      # => "cempotur"
p vowel_rotate("oranges")       # => "erongas"
p vowel_rotate("headphones")    # => "heedphanos"
p vowel_rotate("bootcamp")      # => "baotcomp"
p vowel_rotate("awesome")       # => "ewasemo"

class String
  def select(&prc)
    result = ""
    return result if prc.nil?

    self.each_char do |ch|
      if prc.call(ch)
        result += ch
      end
    end

    result
  end

  def map!(&prc)
    return self if prc.nil?

    self.each_char.with_index do |ch, i|
      self[i] = prc.call(ch, i)
    end

    self
  end
end
