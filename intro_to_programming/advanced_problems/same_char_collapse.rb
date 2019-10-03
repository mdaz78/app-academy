# Write a method same_char_collapse that takes in a string and
# returns a collapsed version of the string. To collapse the
# string, we repeatedly delete 2 adjacent characters that are
# the same until there are no such adjacent characters.
# If there are multiple pairs that can be collapsed,
# delete the leftmost pair. For example, we take the following
# steps to collapse "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy

def same_char_collapse(str)
  collapsed = false
  while !collapsed
    collapsed = true
    str_arr = str.split('')
    i = 0
    while i < str_arr.length - 1
      if str_arr[i] == str_arr[i + 1]
        str_arr[i] = ''
        str_arr[i + 1] = ''
        collapsed = false
        break
      end
      i += 1
    end
    str = str_arr.join('')
  end
  return str
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv