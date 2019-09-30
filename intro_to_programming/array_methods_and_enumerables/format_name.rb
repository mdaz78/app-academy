# Write a method format_name that takes in a name
# string and returns the name properly capitalized.


# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(name)
  formatted_name_arr = []
  name.split(' ').each do |word|
    word_in_small_letters = word.downcase
    formatted_name_arr << word_in_small_letters[0].upcase + word_in_small_letters[1..-1]
  end
  formatted_name_arr.join(' ')
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"
