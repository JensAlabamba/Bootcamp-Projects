require_relative "board"
require_relative "humanplayer"
class Game

def initialize(players, size)
    @board = Board.new(size)
    @players = players.each.map { |mark| HumanPlayer.new(mark) } 
    @current_player = @players[0]
end

def switch_turn
    @players.rotate!
    @current_player = @players[0]
end

def play
    @board.print
    return "Draw :(" if @board.empty_positions? == false
    if @board.empty_positions? == true 
        position = @current_player.get_position
        @board.place_mark(position, @current_player.mark)
    end
    
    if @board.win?(@current_player.mark) == true 
        return "Victory! #{@current_player.mark}!"
    else
         self.switch_turn
         self.play
    end

end
end