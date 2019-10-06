def bubble_sort(arr)
  sorted = false
  while !sorted
    sorted = true
    (0...arr.length - 1).each_with_index do |el, idx|
      if arr[idx] > arr[idx + 1]
        sorted = false
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
      end
    end
  end
  arr
end


p bubble_sort([3, 2, 1])
p bubble_sort([1, 2, 3, 5, 2, 1, 9])
p bubble_sort([9, 8, 7, 6, 5, 4, 3, 2, 1])