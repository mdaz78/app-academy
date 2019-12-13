class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    row, column = pos
    @grid[row][column]
  end

  def []=(pos, value)
    row, column = pos
    @grid[row][column] = value
  end

  def num_ships
    total_num_of_ships = @grid.inject(0) do |acc, arr|
      ships_per_row = arr.count { |el| el == :S }
      acc + ships_per_row
    end
  end
end
