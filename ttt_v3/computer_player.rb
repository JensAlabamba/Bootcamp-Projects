
class ComputerPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end
    
    def get_position(legal_positions)
        position = legal_positions.sample
        p "Computer #{self.mark} picked position #{position.to_s}."
        position
    end
end