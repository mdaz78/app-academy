def is_prime?(num)
  return false if num < 2

  (2...num).each do |fact|
    if num % fact == 0
      return false
    end
  end

  true
end

def nth_prime(n)
  return nil if n < 0

  primes = []
  i = 2

  while n != primes.length
    primes << i if is_prime?(i)
    i += 1
  end

  return primes.last
end

def prime_range(min, max)
  primes = []
  (min..max).each do |num|
    primes << num if is_prime?(num)
  end
  primes
end
