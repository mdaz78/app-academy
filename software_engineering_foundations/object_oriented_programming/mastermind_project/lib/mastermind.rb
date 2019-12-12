require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    p "num exact matches = #{@secret_code.num_exact_matches(code)}"
    p "num near matches = #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    p "Enter a code"
    guess = gets.chomp
    code = Code.from_string(guess)
    print_matches(code)
    code == @secret_code
  end
end
