class GuessingGame
  def initialize(num_1, num_2)
    @num_1 = num_1
    @num_2 = num_2
    @secret_num = rand(num_1..num_2)
    @num_attempts = 0
    @game_over = false
  end

  def num_attempts
    @num_attempts
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1

    if @secret_num == num
      @game_over = true
      p "you win"
    elsif num > @secret_num
      p "too big"
    else
      p "too small"
    end
  end

  def ask_user
    p "enter a number"
    num = gets.chomp.to_i
    self.check_num(num)
  end
end
