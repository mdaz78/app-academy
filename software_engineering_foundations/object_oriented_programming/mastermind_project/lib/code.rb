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
    @pegs[index]
  end

  def length
    @pegs.length
  end

end
