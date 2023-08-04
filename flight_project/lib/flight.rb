require_relative "passenger"

class Flight 

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        return @passengers
    end

    def full?
        return true if @passengers.length == @capacity
        false
    end

    def board_passenger(passenger)
        if full?
            return 
        else    
            @passengers << passenger if passenger.has_flight?(@flight_number)   
        end
    end

    def list_passengers
        names = @passengers.map { |passenger|passenger.name }
        return names
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end