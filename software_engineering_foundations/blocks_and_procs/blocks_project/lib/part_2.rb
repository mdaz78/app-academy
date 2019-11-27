def all_words_capitalized?(words)
  words.all? do |word|
    word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
  end
end

def no_valid_url?(urls)
  valid_endings = [".com", ".net", ".io", ".org"]
  urls.none? { |url| url.end_with?(*valid_endings) }
end

def any_passing_students?(students)
  students.any? do |student|
    sum = student[:grades].sum
    avg = sum / student[:grades].length
    avg >= 75
  end
end