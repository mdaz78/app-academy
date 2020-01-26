def zip(*arrays)
  length = arrays.first.length

  (0...length).map do |i|
    arrays.map { |array| array[i] }
  end
end

def prizz_proc(array, prc1, prc2)
  array.select do |el|
    # either prc1 should be true and prc2 should be false
    # or prc2 should be true and prc1 should be false
    (prc1.call(el) && !prc2.call(el)) || (!prc1.call(el) && prc2.call(el))
  end
end

def zany_zip(*arrays)
  length = arrays.map(&:length).max

  (0...length).map do |i|
    arrays.map { |array| array[i] }
  end
end

def maximum(arr, &prc)
  return nil if arr.empty?
  arr.reduce do |acc, el|
    acc_value = prc.call(acc)
    el_value = prc.call(el)

    if acc_value > el_value
      acc
    else
      el
    end
  end
end

def my_group_by(arr, &prc)
  group = Hash.new() { |h, k| h[k] = []}
  arr.each do |el|
    key = prc.call(el)
    group[key] << el
  end

  group
end

def max_tie_breaker(array, prc, &block)
  return nil if array.empty?

  result = array.first
  array.each do |el|
    result_when_passed_to_block = block.call(result)
    el_when_passed_to_block = block.call(el)

    if el_when_passed_to_block > result_when_passed_to_block 
      result = el
    elsif el_when_passed_to_block == result_when_passed_to_block
      result_when_passed_to_proc = prc.call(result)
      el_when_passed_to_proc = prc.call(el)

      if el_when_passed_to_proc > result_when_passed_to_proc
        result = el
      end
    end
  end

  result
end

def change_word(word)
    indices = vowel_indices(word)
    word[indices.first..indices.last]
end

def vowel_indices(word)
    vowels = 'aeiou'
    indices = []
    word.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end
    indices
end

def silly_syllables(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        num_vowels = vowel_indices(word).length
        if num_vowels < 2
            word
        else
            change_word(word)
        end
    end
    new_words.join(' ')
end
