# Write a method array_translate that takes in an
# array whose elements alternate between words and numbers.
# The method should return a string where each word is
# repeated the number of times that immediately follows in the array.


def array_translate(array)
  result = ""
  array.each_with_index do |el, idx|
    if idx % 2 != 0
      while el > 0
        result += array[idx - 1]
        el -= 1
      end
    end
  end
  result
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts

