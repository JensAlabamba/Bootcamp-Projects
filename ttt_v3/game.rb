require_relative "board"
require_relative "humanplayer"
require_relative "computer_player"
class Game

    def initialize(n, players)
        @players = players.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        @current_player = @players.first
        @board = Board.new(n)
    end

def switch_turn
    @players.rotate!
    @current_player = @players[0]
end

def play
    while @board.empty_positions?
        @board.print
        choices = @board.legal_positions
        position = @current_player.get_position(choices)
        @board.place_mark(position, @current_player.mark)
        if @board.win?(@current_player.mark)
            puts 'Game Over!'
            puts @current_player.mark.to_s + ' is a winner!!!'
            return
        else
            switch_turn
        end
    end

    puts 'Game Over'
    puts 'Draw!'
end
end