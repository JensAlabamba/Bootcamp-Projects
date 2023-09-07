require_relative "board"
require_relative "humanplayer"
class Game

def initialize(player1_mark, player2_mark)
    @board = Board.new
    @player1 = HumanPlayer.new(player1_mark)
    @player2 = HumanPlayer.new(player2_mark)
    @current_player = @player1
end

def switch_turn
   return @current_player = @player2 if @current_player == @player1
   return @current_player = @player1 if @current_player == @player2
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