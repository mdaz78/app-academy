def bubble_sort(arr)
  sorted = false

  while !sorted
    sorted = true

    (0...arr.length - 1).each do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        sorted = false
      end
    end
  end

  arr
end

p bubble_sort([5, 4, 3, 2, 1, 1])