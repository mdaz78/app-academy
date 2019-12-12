class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.split('').map { |_| "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(attempt)
    @attempted_chars.include?(attempt)
  end

  def get_matching_indices(char)
    indices_of_found_letters = []
    @secret_word.each_char.with_index do |elem, idx|
      indices_of_found_letters << idx if elem == char
    end

    indices_of_found_letters
  end

  def fill_indices(char, indices)
    indices.each do |index|
      @guess_word[index] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      false
    else
      @attempted_chars << char
      indices = get_matching_indices(char)
      if indices.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, indices)
      end
      true
    end
  end

  def ask_user_for_guess()
    p "Enter a char:"
    char = gets.chomp
    try_guess(char)
  end

  def win?()
    if @guess_word.join('') == @secret_word
      p "WIN"
      true
    else
      false
    end
  end

  def lose?()
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    return false
  end

  def game_over?()
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end

end