# Write a method that takes in a string and returns the number
# of times that the same letter repeats twice in a row.

def double_letter_count(string)
  pair_count = 0
  i = 0
  while (i < string.length - 1)
    if string[i] == string[i + 1]
      pair_count += 1
    end
    i += 1
  end
  pair_count
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1

