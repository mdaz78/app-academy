require "byebug"

class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(string)
    chars = string.split("")
    Code.new(chars)
  end

  def initialize(chars)
    raise "Invalid chars" unless Code.valid_pegs?(chars)

    @pegs = chars.map(&:upcase)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    count = 0

    (0...guess_code.length).each do |index|
      count += 1 if guess_code[index] == self[index]
    end

    count
  end

  def num_near_matches(guess_code)
    get_near_matches(guess_code)
  end

  def ==(other_code)
    other_code.pegs == self.pegs
  end

  private

  def get_near_matches(code)
    count = 0
    remaining_guess_code, remaining_actual_code = get_actual_and_remaining_guess_codes(code)

    remaining_guess_code.each do |peg|
      if !remaining_actual_code.index(peg).nil?
        index = remaining_actual_code.index(peg)
        remaining_actual_code[index] = ""
        count += 1
      end
    end

    count
  end

  def get_actual_and_remaining_guess_codes(code)
    guess_code = []
    actual_code = []

    (0...code.length).each do |index|
      if code[index] != self[index]
        guess_code << code[index]
        actual_code << self[index]
      end
    end

    [guess_code, actual_code]
  end
end

# code = Code.new(["R", "G", "R", "B"])
# to_check = Code.new(["R", "R", "Y", "B"])

# code.num_near_matches(to_check)
