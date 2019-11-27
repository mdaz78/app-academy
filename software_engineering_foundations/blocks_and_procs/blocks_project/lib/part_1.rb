def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr_of_puppies)
  arr_of_puppies.reject { |puppy_hash| puppy_hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count do |sub_arr|
    sub_arr.sum > 0
  end
end

def aba_translate(word)
  translated_word = ""
  vowels = "aeiou"
  word.each_char.with_index do |char, index|
    if vowels.include?(char.downcase)
      translated_word += char + "b" + char
    else
      translated_word += char
    end
  end

  translated_word
end

def aba_array(arr)
  arr.map { |word| aba_translate(word) }
end