# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

# get factors of a number
def factors_of(num)
  factors = []
  (1...num).each do |n|
    factors << n if num % n == 0
  end

  factors
end

def coprime?(num_1, num_2)
  factors_of_num_1 = factors_of(num_1)
  factors_of_num_2 = factors_of(num_2)

  factors_of_num_1.each do |el|
    return false if factors_of_num_2.include?(el) && el != 1
  end

  true
end


# p coprime?(25, 12)    # => true
# p coprime?(7, 11)     # => true
# p coprime?(30, 9)     # => false
# p coprime?(6, 24)     # => false


