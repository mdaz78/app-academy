# Write a method `factorial(n)` which takes a number and returns the factorial of n.
# A factorial is the product of all whole numbers between 1 and n, inclusive.
# For example, `factorial(5)` is 5 * 4 * 3 * 2 * 1 = 120.
def factorial(n)
  return 1 if n == 1
  n * factorial(n - 1)
end

# p factorial(5)

# Write a method fib(n) that takes in a number and returns the nth number of
# the fibonacci sequence.
# In the fibonacci sequence, the 1st number is 1 and the 2nd number is 1. To generate the
# next number in the sequence, we take the sum of the previous two fibonacci numbers.
# For example the first 5 numbers of the fibonacci sequence are `1, 1, 2, 3, 5`

def fib(n)
  return 1 if n == 1 || n == 2

  fib(n - 1) + fib(n - 2)
end

p fib(1) == 1
p fib(2) == 1
p fib(3) == 2
p fib(4) == 3
p fib(5) == 5
p fib(6) == 8
p fib(7) == 13
