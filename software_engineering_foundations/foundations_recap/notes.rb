# generalized bubble sort

def bubble_sort(arr, &prc)
  sorted = false

  until sorted
    sorted = true
    (0...arr.length - 1).each do |i|
      if prc.call(arr[i], arr[i + 1]) == 1
        arr[i + 1], arr[i] = arr[i], arr[i + 1]
        sorted = false
      end
    end
  end

  arr
end

p bubble_sort([1, 5, 3, 2, 7]) { |a, b| a <=> b }

sorted = bubble_sort(["a", "e", "i", "o", "u", "b"]) do |ele1, ele2|
  alphabets = ("a".."z").to_a
  alphabets.index(ele1) <=> alphabets.index(ele2)
end

p sorted