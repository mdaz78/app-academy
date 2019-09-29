# Write a method yell(words) that takes in an
# array of words and returns a new array where
# every word from the original array has an
# exclamation point after it.


def yell(words)
  yells = []
  for word in words
    yells << word + "!"
  end
  yells
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]
