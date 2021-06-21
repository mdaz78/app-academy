require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new()
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    num_of_ships_placed = @board.num_ships
    puts num_of_ships_placed
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      true
    else
      false
    end
  end

  def win?
    ships_count = @board.num_ships

    if ships_count == 0
      puts "you win"
      true
    else
      false
    end
  end

  def game_over?
    self.win? || self.lose?
  end

  def turn
    move = @player.get_move
    ship_sunk = @board.attack(move)
    @board.print
    puts @remaining_misses

    unless ship_sunk
      @remaining_misses -= 1
    end

    puts @remaining_misses
  end
end
