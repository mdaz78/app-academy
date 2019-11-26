# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  prime_factors = []
  (1..num).each do |n|
    if num % n == 0 && prime?(n)
      prime_factors << n
    end
  end
  prime_factors.max
end

def prime?(num)
  return false if num < 2
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

def unique_chars?(word)
  already_seen = []
  word.each_char do |char|
    if already_seen.include?(char)
      return false
    end
    already_seen << char
  end
  return true
end


def dupe_indices(array)
  duplicates = Hash.new { |h, k| h[k] = [] }

  array.each.with_index do |char, i|
    duplicates[char] << i
  end

  duplicates.select { |ele, arr| arr.length > 1 }
end


def total_ele(arr)
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
  end
  hash
end

def ana_array(array1, array2)
  total_ele(array1) == total_ele(array2)
end