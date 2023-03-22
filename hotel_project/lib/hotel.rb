require_relative "room"

class Hotel
  
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |key, value|
            @rooms[key] = Room.new(value)
        end
    end

    def name
        capitalized = @name.split(" ").each { |word| word.capitalize! } 
        return capitalized.join(" ")
    end

    def rooms 
        @rooms
    end

    def room_exists?(name)
        return true if @rooms.include?(name)
        false
    end

    def check_in(person, room_name)
        if      self.room_exists?(room_name)
            if    @rooms[room_name].add_occupant(person)
                    puts "check in successful"
            else
                    puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0 }
    end

    def list_rooms
        @rooms.each do |room, capacity|
            puts "#{room} #{capacity.available_space}"
        end

    end
end
