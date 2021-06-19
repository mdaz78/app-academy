require_relative "code"

class Mastermind
  def initialize(length)
    @length = length
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    exact_matches = @secret_code.num_exact_matches(code)
    near_matches = @secret_code.num_near_matches(code)

    puts "Exact Mathes => #{exact_matches}"
    puts "Near Mathes => #{near_matches}"
  end

  def ask_user_for_guess()
    puts "Enter a code => "
    entered_code = gets.chomp
    code = Code.from_string(entered_code)
    print_matches(code)

    @secret_code == code
  end
end
