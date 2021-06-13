require "byebug"

def all_words_capitalized?(words)
  words.all? { |word| word.capitalize == word }
end

def no_valid_url?(urls)
  valid_end_points = [".com", ".net", ".io", ".org"]
  urls.none? { |url| url.end_with?(*valid_end_points) }
end

def any_passing_students?(students)
  students.any? do |student|
    total_grades = student[:grades].sum
    total_number_of_scores = student[:grades].length * 1.0
    average_grades = total_grades / total_number_of_scores

    average_grades >= 75.0
  end
end

# students = [
#   { name: "Alvin", grades: [70, 50, 75] },
#   { name: "Warlin", grades: [80, 99, 95] },
#   { name: "Vlad", grades: [100] },
# ]
# p any_passing_students?(students)
