class Player
    def get_move
        integ = []
        puts "enter a position with cooridnates seperated with a space like '4 7'"
        shoot = gets.chomp
        integ << shoot.split(" ")[0].to_i
        integ << shoot.split(" ")[1].to_i
        return integ
    end
end
