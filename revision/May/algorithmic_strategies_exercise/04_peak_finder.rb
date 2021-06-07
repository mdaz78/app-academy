# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
  peaks = []

  (0...arr.length).each do |index|
    if index == 0
      peaks << arr[index] if arr[index + 1] < arr[index]
    elsif index == arr.length - 1
      peaks << arr[index] if arr[index] > arr[index - 1]
    else
      peaks << arr[index] if arr[index] > arr[index - 1] && arr[index] > arr[index + 1]
    end
  end

  peaks
end

p peak_finder([1, 3, 5, 4]) == [5]
p peak_finder([4, 2, 3, 6, 10]) == [4, 10]
p peak_finder([4, 2, 11, 6, 10]) == [4, 11, 10]
p peak_finder([1, 3]) == [3]
p peak_finder([3, 1]) == [3]