# The fibonacci sequence is a sequence of numbers whose first
# and second elements are 1. To generate further elements
# of the sequence we take the sum of the previous two elements.
# For example the first 6 fibonacci numbers are 1, 1, 2, 3, 5, 8.
# Write a method fibonacci that takes in a number length and returns
# the fibonacci sequence up to the given length.

def fibonacci(length)
  fib_seq = []
  if length == 0
    return fib_seq
  end

  if length == 1
    fib_seq << 1
    return fib_seq
  end

  fib_seq.push(1, 1)
  (2...length).each do |idx|
    latter_element = fib_seq[idx - 1]
    previous_element = fib_seq[idx - 2]
    next_element = latter_element + previous_element
    fib_seq << next_element
  end
  fib_seq
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts