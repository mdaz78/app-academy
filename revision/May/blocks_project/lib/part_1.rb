require "byebug"

def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(puppies)
  puppies.reject { |puppy| puppy["age"] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |inner_arr| inner_arr.sum > 0 }
end

def aba_translate(string)
  vowels = "aeiou"

  translated_arr = string.split("").map do |ch|
    if vowels.include?(ch)
      ch + "b" + ch
    else
      ch
    end
  end

  translated_arr.join("")
end

def aba_array(words)
  words.map { |word| aba_translate(word) }
end
