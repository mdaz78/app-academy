# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def is_prime?(num)
  return false if num < 2
  (2...num).each do |n|
    return false if num % n == 0
  end

  true
end

def get_prime_factors(num)
  factors = []
  (1..num).each do |n|
    factors << n if num % n == 0 && is_prime?(n)
  end

  factors
end

def largest_prime_factor(num)
  prime_divisors = get_prime_factors(num)
  prime_divisors.max
end

def unique_chars?(string)
  character_count = Hash.new(0)

  string.each_char { |ch| character_count[ch] += 1 }

  counts = character_count.values
  counts.none? { |num| num >= 2 }
end

def dupe_indices(array)
  indices_hash = {}

  array.each.with_index do |el, index|
    unless indices_hash.key?(el)
      indices_hash[el] = [index]
    else
      indices_hash[el] << index
    end
  end
  indices_hash.select { |k, v| v.length != 1 }
end

def get_count_hash_for(arr)
  hash = Hash.new(0)

  arr.each do |el|
    hash[el] += 1
  end

  hash
end

def ana_array(arr_1, arr_2)
  return false if arr_1.length != arr_2.length

  hash_1 = get_count_hash_for(arr_1)
  hash_2 = get_count_hash_for(arr_2)

  hash_1 == hash_2
end
