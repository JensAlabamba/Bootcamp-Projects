require_relative "board"
require_relative "player"

class Battleship

attr_reader :board, :player
   
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "Number of ships: #{@board.num_ships} "
        puts @board.print
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
        if @board.num_ships == 0 
            puts "you win"
            true
        else 
            false
        end
    end

    def game_over?
        if self.win? || self.lose?
            return true
        else
            return false 
        end
    end

    def turn
        if @board.attack(@player.get_move)
        @board.print
        puts "Remaining misses: #{@remaining_misses} "
        else    
                @board.print
                @remaining_misses -= 1
                puts "Remaining misses: #{@remaining_misses} "
        end
    end
end
