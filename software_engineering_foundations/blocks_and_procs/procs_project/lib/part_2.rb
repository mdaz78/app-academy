def reverser(string, &prc)
  reversed_string = string.reverse
  prc.call(reversed_string)
end


def word_changer(sentence, &prc)
  words = sentence.split(" ")
  changed_words = []
  words.each do |word|
    changed_words << prc.call(word)
  end

  changed_words.join(" ")
end


def greater_proc_value(num, prc1, prc2)
  prc1_result = prc1.call(num)
  prc2_result = prc2.call(num)

  prc1_result > prc2_result ? prc1_result : prc2_result
end


def and_selector(arr, prc1, prc2)
  result_arr = []

  arr.each do |el|
    if prc1.call(el) && prc2.call(el)
      result_arr << el
    end
  end

  result_arr
end


def alternating_mapper(arr, prc1, prc2)
  result_arr = []

  arr.each.with_index do |el, idx|
    if idx % 2 == 0
      result_arr << prc1.call(el)
    else
      result_arr << prc2.call(el)
    end
  end


  result_arr
end