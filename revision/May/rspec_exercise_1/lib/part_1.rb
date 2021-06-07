def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr)
  divisor = arr.length * 1.0
  dividend = arr.sum

  dividend / divisor
end

def repeat(str, times)
  str * times
end

def yell(str)
  str.upcase! + "!"
end

def alternating_case(sentence)
  alternating_words = sentence.split(" ").map.with_index do |word, index|
    if index.even?
      word.upcase
    else
      word.downcase
    end
  end

  alternating_words.join(" ")
end
