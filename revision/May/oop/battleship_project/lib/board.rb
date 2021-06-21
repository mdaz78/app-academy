class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count { |ship| ship == :S }
  end

  def attack(pos)
    grid = self[pos]

    if grid == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25

    while num_ships < total_ships
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      position = [rand_row, rand_col]
      self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |el|
        if el == :S
          :N
        else
          el
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
