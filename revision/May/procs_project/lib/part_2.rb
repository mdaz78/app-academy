def reverser(string, &prc)
  reversed_string = string.reverse
  prc.call(reversed_string)
end

def word_changer(sentence, &prc)
  words = sentence.split(" ")
  result = words.map(&prc)
  result.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  n_1 = prc_1.call(num)
  n_2 = prc_2.call(num)

  n_1 > n_2 ? n_1 : n_2
end

def and_selector(array, prc_1, prc_2)
  array.select do |el|
    prc_1.call(el) && prc_2.call(el)
  end
end

def alternating_mapper(array, prc_1, prc_2)
  array.map.with_index do |el, index|
    if index.even?
      prc_1.call(el)
    else
      prc_2.call(el)
    end
  end
end
