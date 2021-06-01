# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(string)
  compressed_str = ""
  similar_count = 1

  (0...string.length).each do |index|
    if string[index] == string[index + 1]
      similar_count += 1
    else
      compressed_str += similar_count.to_s if similar_count > 1
      compressed_str += string[index]

      similar_count = 1
    end
  end

  compressed_str
end

p compress_str("aaabbc") == "3a2bc"
p compress_str("xxyyyyzz") == "2x4y2z"
p compress_str("qqqqq") == "5q"
p compress_str("mississippi") == "mi2si2si2pi"
