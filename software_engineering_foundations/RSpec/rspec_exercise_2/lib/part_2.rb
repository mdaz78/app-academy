def palindrome?(str)
  str == reverse(str)
end

def reverse(str)
  i = str.length - 1
  reversed_str = ""
  while i >= 0
    reversed_str += str[i]
    i -= 1
  end

  reversed_str
end


def substrings(word)
  substrings_arr = []
  word.each_char.with_index do |outer_ch, outer_index|
    word.each_char.with_index do |inner_ch, inner_index|
      if inner_index >= outer_index
        substrings_arr << word[outer_index..inner_index]
      end
    end
  end

  substrings_arr
end


def palindrome_substrings(str)
  substrings_arr = substrings(str)
  palindrome_substrings_arr = substrings_arr.select { |word| palindrome?(word) && word.length > 1 }
  palindrome_substrings_arr
end