# Write a method prime_factors that takes in a number and
# returns an array containing all of the prime factors of the given number.

def prime_factors(num)
  prime_factors_arr = []
  (1..num).each do |n|
    if num % n == 0 && prime?(n)
      prime_factors_arr << n
    end
  end
  prime_factors_arr
end

def prime?(num)
  return false if num < 2
  return true if num == 2
  (2...num).each do |n|
    if num % n == 0
      return false
    end
  end
  true
end


print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts