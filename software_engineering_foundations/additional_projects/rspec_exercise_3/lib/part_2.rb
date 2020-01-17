def element_count(arr)
  count_hash = Hash.new(0)

  arr.each do |el|
    count_hash[el] += 1
  end

  count_hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |ch, i|
    str[i] = hash[ch] || str[i]
  end

  str
end

def product_inject(arr)
  arr.inject do |acc, el|
    acc * el
  end
end
