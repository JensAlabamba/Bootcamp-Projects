class Item

    
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        splitted = date_string.split("-")
        return false if splitted[0].length > 4 
        return false if !(1..12).include?(splitted[1].to_i)
        return false if !(1..31).include?(splitted[2].to_i)

        true
    end

    def initialize(title, deadline, description)
        
        @title = title
        if Item.valid_date?(deadline)
        @deadline = deadline
        else 
            raise "Date invalid! Try 'YYYY-MM-DD'"
            false
        end
        @description = description
        @done = false

    end

    def done?
        @done
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "Invalid format. Check if date is correct. Try 'YYYY-MM-DD'"
        end
    end

    def toggle
        return @done = true if @done == false
        return @done = false if @done == true
    end
end