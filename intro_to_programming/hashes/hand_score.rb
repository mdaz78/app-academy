# Write a method hand_score that takes in a string representing
# a hand of cards and returns it's total score. You can assume
# the letters in the string are only A, K, Q, J.
# A is worth 4 points, K is 3 points, Q is 2 points,
# and J is 1 point. The letters of the input string
# not necessarily uppercase.

def hand_score(hand)
  score = 0
  point_hash = { "a" => 4, "k" => 3, "q" => 2, "j" => 1 }
  hand.split('').each do |letter|
    score += point_hash[letter.downcase]
  end
  score
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9