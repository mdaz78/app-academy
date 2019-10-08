def average(num1, num2)
  (num1 + num2) / 2.0
end


def average_array(arr)
  length = arr.length * 1.0
  sum = arr.sum
  sum / length
end

def repeat(str, times_to_repeat)
  str * times_to_repeat
end


def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  word_arr = sentence.split(' ')
  alternating_arr = word_arr.map.with_index do |word, idx|
    if idx % 2 == 0
      word.upcase
    else
      word.downcase
    end
  end
  alternating_sentence = alternating_arr.join(' ')
  alternating_sentence
end