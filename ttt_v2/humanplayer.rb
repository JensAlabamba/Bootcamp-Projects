require_relative "board"
require_relative "game"

class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position
        p "Please enter to digits seperated by single space to choose a spot!"
        player_choice = gets.chomp.split(" ").map(&:to_i)
        raise "Wrong input" if player_choice.length != 2
        player_choice
    end
end