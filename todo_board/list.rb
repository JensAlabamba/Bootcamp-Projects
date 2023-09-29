require_relative "item"

class List
    
    attr_accessor :label

    def initialize(label)

        @label = label
        @items = Array.new

    end

    def add_item(title, deadline, description = "")
        new_item = Item.new(title, deadline, description)
        return true if @items << new_item
        false
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 
        return false if index > self.size - 1
        true
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        hold = @items[index_1]
        @items[index_1] = @items[index_2]
        @items[index_2] = hold

        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "-".ljust(50, "-")
        puts " ".ljust(22, " ") + @label.upcase
        puts "-".ljust(50, "-")
        puts "Index".ljust(6) + "|".ljust(2) + "Item".ljust(20) + "|".ljust(2) + "Deadline".ljust(11) + "|".ljust(2) + "Done?"
        puts "-".ljust(50, "-")
        @items.each_with_index do |item, idx|
        puts idx.to_s.ljust(6) + "|".ljust(2) + item.title.ljust(20) + "|".ljust(2) + item.deadline.ljust(11) + "|".ljust(2) + item.done?.to_s
        end
        puts "-".ljust(50, "-")
    end

    def print_full_item(index)
        puts "-".ljust(50, "-")
        puts "Item:".ljust(40) + "Deadline:"
        puts @items[index].title.ljust(40) + @items[index].deadline
        puts "-".ljust(50, "-")
        puts "Description:".ljust(40) + "Done?:"
        if 
            @items[index].description.length > 0 
            puts @items[index].description.ljust(40) + @items[index].done?.to_s
        else 
            puts "No description given.".ljust(40) + @items[index].done?.to_s
        end
        puts "-".ljust(50, "-")
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
       
        return false if !valid_index?(index)
            if amount > 0 
             swap(index, index - 1)
             up(index - 1, amount - 1)
            else
                true
            end 
    end

    def down(index, amount = 1)

        return false if !valid_index?(index)
            if amount > 0 && index < @items.length - 1
                swap(index + 1, index)
                down(index + 1, amount - 1)
            else
                true 
            end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline.split("-").join("").to_i }
    end

    def toggle_item(index)
       @items[index].toggle 
    end

    def remove_item(index)
        @items.delete_at(index)
    end

    def purge
        @items.reject! { |item| item.done? == true }
    end
end