# calculate the factorial of a number recursively
def factorial_recursive(n)
  return 1 if n == 1
  n * factorial_recursive(n - 1)
end


# calculate the factorial of a number
def factorial(n)
  result = 1
  while n > 0
    result = result * n
    n -= 1
  end

  result
end

# fibonacci sequence
# 1 1 2 3 5 8 13
def fib_rec(n)
  return 1 if n == 1 || n == 2
  fib_rec(n - 1) + fib_rec(n - 2)
end

p fib_rec(7)

# fibonacci sequence iteratively
def fib(n)
  return 1 if n == 1 || n == 2

  prev_num_in_seq = 1
  next_num_in_seq = 1

  result = 0

  (n - 2).times do |_|
    result = prev_num_in_seq + next_num_in_seq
    prev_num_in_seq = next_num_in_seq
    next_num_in_seq = result
  end
  result
end

p fib(5)