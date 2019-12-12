class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? do |char|
      POSSIBLE_PEGS.keys.include?(char.upcase)
    end
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map { |char| char.upcase }
    else
      raise "Pegs are not valid"
    end
  end

  def self.random(length)
    random_pegs = []
    (0...length).each do
      random_pegs << POSSIBLE_PEGS.keys.sample
    end

    Code.new(random_pegs)
  end

  def self.from_string(string)
    pegs = string.split('')
    Code.new(pegs)
  end

  def [](index)
    self.pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    exact_matches = 0
    @pegs.each.with_index do |peg, index|
      exact_matches += 1 if peg == code[index]
    end
    exact_matches
  end

  def num_near_matches(code)
    near_matches = 0
    @pegs.each.with_index do |peg, index|
      if peg != code[index] && @pegs.include?(code[index])
        near_matches += 1
      end
    end
    near_matches
  end

  def ==(code)
    self.pegs == code.pegs
  end

end
