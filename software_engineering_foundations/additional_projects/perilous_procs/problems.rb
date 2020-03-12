# some?
#
# Write a method some? that accepts an array and a block as arguments. The
# method should return a boolean indicating whether or not at least one of the
# elements of the array returns true when given to the block. Solve this using
# Array#each.
def some?(arr, &prc)
  arr.each do |el|
    return true if prc.call(el)
  end
  false
end


# Examples
# p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
# p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
# p some?([8, 2]) { |n| n.even? }                                       # true
# p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
# p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
# p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true


# exactly?
#
# Write a method exactly? that accepts an array, a number (n), and a block as
# arguments. The method should return a boolean indicating whether or not there
# are exactly n elements that return true when given to the block. Solve this
# using Array#each.
def exactly?(arr, n, &prc)
  true_count = 0
  arr.each do |el|
    true_count += 1 if prc.call(el)
  end
  n == true_count
end

# p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
# p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
# p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
# p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
# p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
# p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
# p exactly?([4, 5], 3) { |n| n > 0 }                             # false
# p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
# p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true

# filter_out
#
# Write a method filter_out that accepts an array and a block as arguments. The
# method should return a new array where elements of the original array are
# removed if they return true when given to the block. Solve this using
# Array#each.
def filter_out(arr, &prc)
  filtered_arr = []
  arr.each do |el|
    filtered_arr << el unless prc.call(el)
  end
  filtered_arr
end

# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
# p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
# p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]

# at_least?
#
# Write a method at_least? that accepts an array, a number (n), and a block as an
# arguments. The method should return a boolean indicating whether or not at
# least n elements of the array return true when given to the block. Solve this
# using Array#each.
def at_least?(arr, n, &prc)
  true_count = 0
  arr.each do |el|
    true_count += 1 if prc.call(el)
  end
  true_count >= n
end

# p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # false
# p at_least?([false, false, false], 3) { |bool| bool }
# # false
# p at_least?([false, true, true], 3) { |bool| bool }
# # false
# p at_least?([true, true, true], 3) { |bool| bool }
# # true
# p at_least?([true, true, true, true], 3) { |bool| bool }
# # true


# every?

# Write a method every? that accepts an array and a block as arguments. The
# method should return a boolean indicating whether or not all elements of the
# array return true when given to the block. Solve this using Array#each.
def every?(arr, &prc)
  arr.each do |el|
    return false unless prc.call(el)
  end
  true
end

# p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
# p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
# p every?([8, 2]) { |n| n.even? }                                        # true
# p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
# p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
# p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true



# at_most?

# Write a method at_most? that accepts an array, a number (n), and a block as
# arguments. The method should return a boolean indicating whether no more than
# n elements of the array return true when given to the block. Solve this using
# Array#each.

def at_most?(arr, n, &prc)
  true_count = 0
  arr.each do |el|
    true_count += 1 if prc.call(el)
  end
  true_count <= n
end

# p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
# p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
# p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
# p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
# p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false


# first_index

# Write a method first_index that accepts an array and a block as arguments. The
# method should return the index of the first element of the array that returns
# true when given to the block. If no element of returns true, then the method
# should return nil. Solve this using Array#each.

def first_index(arr, &prc)
  arr.each.with_index do |el, idx|
    return idx if prc.call(el)
  end
  nil
end

# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil

# xnor_select

# Write a method xnor_select that accepts an array and two procs as arguments.
# The method should return a new array containing elements of the original array
# that either return true for both procs or return false for both procs.

def xnor_select(arr, prc1, prc2)
  selected_elements = []
  arr.each do |el|
    selected_elements << el if (prc1.call(el) && prc2.call(el)) || (prc1.call(el) == false && prc2.call(el) == false)
  end
  selected_elements
end

# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]



# filter_out!
#
# Rewrite your previous filter_out method to mutate the input array instead of
# returning a new array. That is, write a method filter_out! that accepts an
# array and a block as args. The method should remove elements of the input
# array that return true when given to the block. Solve this without using
# Array.reject!.
def filter_out!(arr, &prc)
  arr.reject! { |el| prc.call(el) }
end

# arr_1 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_1) { |x| x.odd? }
# p arr_1     # [10, 6, 2]

# arr_2 = [1, 7, 3, 5 ]
# filter_out!(arr_2) { |x| x.odd? }
# p arr_2     # []

# arr_3 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_3) { |x| x.even? }
# p arr_3     # [3, 5]

# arr_4 = [1, 7, 3, 5 ]
# filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# p arr_4 # [1, 7, 3, 5]


# multi_map

# Write a method multi_map that accepts an array, an optional number (n), and a
# block as arguments. The method should return a new array where each element of
# the original array is repeatedly run through the block n times. If the number
# argument is not passed in, then the the elements should be run through the
# block once.

def multi_map(arr, n = nil, &prc)
  n ||= 1
  (0...n).each do |_|
    arr = arr.map { |el| prc.call(el) }
  end
  arr
end

# p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
# p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
# p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
# p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]


# proctition

# Write a method proctition that accepts an array and a block as arguments. The
# method should return a new array where the elements that return true when
# given to the block come before all of the elements that return false when
# given to the block. This means that the new array has two partitions; the
# order among elements in the same partition should be the same as their
# relative order in the input array.

def proctition(arr, &prc)
  truthy_elements = []
  falsy_elements = []

  arr.each do |el|
    if prc.call(el)
      truthy_elements << el
    else
      falsy_elements << el
    end
  end

  truthy_elements + falsy_elements
end

# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # [4, 7, 1, 3, -5, -10, -2]

# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # [8, 6, 10, 7, 3]

# p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # ["boot", "bug", "boat", "cat", "dog"]
