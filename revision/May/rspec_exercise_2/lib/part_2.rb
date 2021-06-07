def reverse(str)
  reversed_str = ""
  positional_constant = str.length - 1

  i = 0
  while i < str.length
    reversed_str[i] = str[positional_constant - i]
    i += 1
  end

  reversed_str
end

def palindrome?(str)
  str == reverse(str)
end

def substrings(word)
  substring_arr = []
  i = 0

  while i < word.length
    j = i

    while j < word.length
      substring_arr << word[i..j]
      j += 1
    end

    i += 1
  end

  substring_arr
end

def palindrome_substrings(string)
  substrings(string).filter { |word| word.length > 1 && palindrome?(word) }
end
