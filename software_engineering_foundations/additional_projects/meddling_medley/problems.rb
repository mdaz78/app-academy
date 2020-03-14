# Phase 1 ( Modest Problems )

# duos
# Write a method duos that accepts a string as an argument and returns the count
# of the number of times the same character appears consecutively in the given
# string.
def duos(word)
  repetition_count = 0
  (0...word.length - 1).each do |idx|
    repetition_count += 1 if word[idx] == word[idx + 1]
  end
  repetition_count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# sentence_swap
#
# Write a method sentence_swap that accepts a sentence and a hash as arguments.
# The method should return a new sentence where every word is replaced with
# it's corresponding value in the hash. If a word does not exist as a key of the
# hash, then it should remain unchanged.
def sentence_swap(sentence, hash)
  words = sentence.split
  swapped_words = words.map do |word|
    hash[word] || word
  end
  swapped_words.join(' ')
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'
#
# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'
#
# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# hash_mapped
#
# Write a method hash_mapped that accepts a hash, a proc, and a block. The method
# should return a new hash where each key is the result of the original key when
# given to the block. Each value of the new hash should be the result of the
# original values when passed into the proc.

def hash_mapped(hash, prc1, &prc2)
  result_hash = {}
  hash.each do |key, value|
    result_hash[prc2.call(key)] = prc1.call(value)
  end
  result_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}
#
# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# counted_characters
#
# Write a method counted_characters that accepts a string as an argument. The
# method should return an array containing the characters of the string that
# appeared more than twice. The characters in the output array should appear in
# the same order they occur in the input string.

def counted_characters(sentence)
  char_hash = Hash.new(0)
  sentence.each_char do |ch|
    char_hash[ch] += 1
  end
  char_hash.select { |char, occurrences| occurrences > 2 }.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []



# triplet_true?
#
# Write a method triplet_true? that accepts a string as an argument and returns a
# boolean indicating whether or not the string contains three of the same
# character consecutively.

def triplet_true(word)
  (0...word.length - 2).each do |index|
    return true if (word[index] == word[index + 1] && word[index] == word[index + 2])
  end
  false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# energetic_encoding
#
# Write a method energetic_encoding that accepts a string and a hash as
# arguments. The method should return a new string where characters of the
# original string are replaced with the corresponding values in the hash. If a
# character is not a key of the hash, then it should be replaced with a question
# mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(sentence, encoder_hash)
  encoded_string = ""
  sentence.each_char do |ch|
    if encoder_hash.has_key?(ch)
      encoded_string += encoder_hash[ch]
    elsif ch == " "
      encoded_string += ch
    else
      encoded_string += "?"
    end
  end
  encoded_string
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'
#
# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'
#
# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'
#
# p energetic_encoding('bike', {}) # '????'

# uncompress
#
# Write a method uncompress that accepts a string as an argument. The string
# will be formatted so every letter is followed by a number. The method should
# return an "uncompressed" version of the string where every letter is repeated
# multiple times given based on the number that appears directly after the
# letter.
def uncompress(str)
  uncompressed_str = ""
  (0...str.length - 1).each do |i|
    uncompressed_str += (str[i] * (str[i + 1]).to_i) if i.even?
  end
  uncompressed_str
end


# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# Phase 2: More difficult, maybe?
#conjunct_select

# Write a method conjunct_select that accepts an array and one or more procs as
# arguments. The method should return a new array containing the elements that
# return true when passed into all of the given procs.
def conjunct_select(arr, *prcs)
  conjucts = arr.select do |el|
    prcs.all? { |prc| prc.call(el) }
  end
  conjucts
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
#
# Write a method convert_pig_latin that accepts a sentence as an argument. The
# method should translate the sentence according to the following rules:
#
#   words that are shorter than 3 characters are unchanged
#   words that are 3 characters or longer are translated according to the following rules:
#         if the word begins with a vowel, simply add 'yay' to the end of the
#         word (example: 'eat'->'eatyay')
#         if the word begins with a non-vowel, move all letters that come before
#         the word's first vowel to the end of the word and add 'ay' (example:
#                                                                     'trash'->'ashtray')
#
# Note that if words are capitalized in the original sentence, they should remain
# capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
def convert_pig_latin(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
      new_word = word.length > 2 ? convert_word(word) : word
      word == word.capitalize ? new_word.capitalize : new_word
  end
  new_words.join(' ')
end

def convert_word(word)
  vowels = 'AEIOUaeiou'
  return word + 'yay' if vowels.include?(word[0])
  word.each_char.with_index do |char, i|
      if vowels.include?(char)
          return word[i..-1] + word[0...i] + 'ay'
      end
  end
end


# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"


# reverberate
# Write a method reverberate that accepts a sentence as an argument. The method
# should translate the sentence according to the following rules:
#     words that are shorter than 3 characters are unchanged
#     words that are 3 characters or longer are translated according to the following rules:
#       if the word ends with a vowel, simply repeat the word twice (example:
#       'like'->'likelike')
#
#       if the word ends with a non-vowel, repeat all letters
#       that come after the word's last vowel, including the last vowel itself
#       (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should
# remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
def reverberate(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
    new_word = word.length > 2 ? reverberate_word(word) : word
    word.capitalize == word ? new_word.capitalize : new_word
  end
  new_words.join(' ')
end

def reverberate_word(word)
  vowels = 'AEIOUaeiou'
  return word * 2 if vowels.include?(word[-1])

  i = word.length - 1
  while i >= 0
    return word + word[i..-1] if vowels.include?(word[i])

    i -= 1
  end
  ''
end

# p reverberate('We like to go running fast') == "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') == "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') == "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') == "Herer familyily flewew to Francefrance"


# disjunct_select
#
# Write a method disjunct_select that accepts an array and one or more procs as arguments.
# The method should return a new array containing the elements that return
# true when passed into at least one of the given procs.
def disjunct_select(arr, *prcs)
  arr.select do |el|
    prcs.any? do |prc|
      prc.call(el)
    end
  end
end


# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }
#
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#                   longer_four,
#                   ) # ["apple", "teeming"]
#
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#                   longer_four,
#                   contains_o
#   ) # ["dog", "apple", "teeming", "boot"]
#
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#                   longer_four,
#                   contains_o,
#                   starts_a
#   ) # ["ace", "dog", "apple", "teeming", "boot"]
#

# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument.
# The method should return a new sentence where the words alternate
# between having their first or last vowel removed. For example:
# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ...and so on
# Note that words that contain no vowels should remain unchanged.
VOWELS = "AEIOUaeiou"
def alternating_vowel(sentence)
  words = sentence.split(' ')
  new_words = words.map.with_index do |word, index|
    if index.even?
      remove_first_vowel(word)
    else
      remove_last_vowel(word)
    end
  end
  new_words.join(' ')
end

def remove_first_vowel(word)
  (0...word.length).each do |i|
    return word[0...i] + word[i + 1..-1] if VOWELS.include?(word[i])
  end
  word
end

def remove_last_vowel(word)
  remove_first_vowel(word.reverse).reverse
end

# p alternating_vowel('panthers are great animals') == "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') == "rnning panthrs re epc"
# p alternating_vowel('code properly please') == "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') == "my forecst prdicts ran tday"


# silly_talk
#
# Write a method silly_talk that accepts a sentence as an argument.
# The method should translate each word of the sentence according
# to the following rules:
#
# if the word ends with a vowel, simply repeat
# that vowel at the end of the word
# (example: 'code'->'codee')
#
# if the word ends with a non-vowel,
# every vowel of the word should be
# followed by 'b' and that same vowel
# (example: 'siren'->'sibireben')
#
# Note that if words are capitalized in the original sentence,
# they should remain capitalized in the translated sentence.
def silly_talk(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
    if VOWELS.include?(word[-1])
      new_word = word + word[-1]
      word.capitalize == word ? new_word.capitalize : new_word
    else
      new_word = make_silly(word)
      word.capitalize == word ? new_word.capitalize : new_word
    end
  end
  new_words.join(' ')
end


def make_silly(word)
  vowels = "AEIOUaeiou"
  letters = word.split('')
  sillys = []
  (0...letters.length).each do |i|
    if vowels.include?(letters[i])
      sillys << letters[i] + "b" + letters[i]
    else
      sillys << letters[i]
    end
  end
  sillys.join('')
end


# p silly_talk('Kids like cats and dogs') == "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') == "Stobop thabat scobooboteber"
# p silly_talk('They can code') == "Thebey caban codee"
# p silly_talk('He flew to Italy') == "Hee flebew too Ibitabaly"


# compress

# Write a method compress that accepts a string as an argument. The method
# should return a "compressed" version of the string where streaks of
# consecutive letters are translated to a single appearance of the letter
# followed by the number of times it appears in the streak. If a letter does not
# form a streak (meaning that it appears alone), then do not add a number after
# it.
def compress(word)
  compressed_word = ''
  i = 0
  while i < word.length
    temp = word[i]
    count = 1
    while word[i] == word[i + 1]
      count += 1
      i += 1
    end
    i += 1
    if count > 1
      compressed_word += temp + count.to_s
    else
      compressed_word += temp
    end
  end
  compressed_word
end

p compress('aabbbbc')    == "a2b4c"
p compress('boot')       == "bo2t"
p compress('xxxyxxzzzz') == "x3yx2z4"