require_relative "flight"

class Passenger
   
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        @name
    end

    def has_flight?(flight_number)
        @flight_numbers.include?(flight_number.upcase)
    end

    def add_flight(str)
        flight_upcase = str.upcase
        @flight_numbers << flight_upcase if !self.has_flight?(flight_upcase)
    end
end