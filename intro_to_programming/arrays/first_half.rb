# Write a method first_half(array) that takes in an array
# and returns a new array containing the first half of
# the elements in the array. If there is an odd number
# of elements, return the first half including the middle element.


def first_half(array)
  length = array.length
  end_of_arr = 0
  if is_even?(length)
    end_of_arr = (length / 2) - 1
  else
    end_of_arr = (length / 2)
  end

  i = 0
  result = []
  while i <= end_of_arr
    result << array[i]
    i += 1
  end
  result
end

def is_even?(num)
  num % 2 == 0
end

print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]
