def proper_factors(num)
  factors = []

  (1...num).each do |factor|
    factors << factor if num % factor == 0
  end

  factors
end

def aliquot_sum(num)
  proper_factors_arr = proper_factors(num)
  proper_factors_arr.sum
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(num)
  ideal_numbers_arr = []

  i = 1
  while num != ideal_numbers_arr.length
    ideal_numbers_arr << i if perfect_number?(i)
    i += 1
  end

  ideal_numbers_arr
end
