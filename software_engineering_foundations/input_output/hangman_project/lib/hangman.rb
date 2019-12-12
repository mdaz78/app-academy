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

end