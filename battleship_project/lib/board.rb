class Board
  attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]] 
    end

    def []=(pos, v)
        @grid[pos[0]][pos[1]] = v
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            true
        else self[pos] = :X 
            false
        end
    end

    def place_random_ships
        total_ships = @size * 0.25

        while self.num_ships < total_ships
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = [rand_col, rand_row]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                    :N
                else
                    ele
                end
            end
        end
    end
    
    def self.print_grid(arr)
        (0...arr.length).each do |row|
            puts arr[row].join(" ")
        end
    end

    def cheat
       puts self.class.print_grid(@grid)
    end

    def print
        puts self.class.print_grid(hidden_ships_grid)
    end
end
