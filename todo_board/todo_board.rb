require_relative "list"

class TodoBoard

    def initialize

        @lists = Hash.new
       
    end

    def get_command
        puts "Enter a command. Enter $help to see all commands."

        cmd, *args = gets.chomp.split(" ")
        
        case cmd
        when "help"
        puts "Available commands:
        - mklist <new_list_label> # Makes new list!
        - ls #shows all the list's labels made!
        - showall #Shows all the lists!
        - mktodo <list_label> <item_title> <deadline> <optional description> # Makes new todo!
        - toggle <list_label> <index> #toggles done to true or false
        - up <list_label> <index> <optional amount>  #moves an item up the list
        - down <list_label> <index> optional amount> #moves an item down the list
        - swap <index_1> <index_2>  #swaps items on a list
        - sort <list_label> #sorts by date
        - priority <list_label> #shows item at the top of a list
        - print <list_label> <optional index> #if index not given shows full list, with given index shows all information about item
        - rm <list_label> <index> #removes item from a list
        - purge <list_label> #removes all items set as done (true)
        - quit #quits the program"
        
        when "mklist"
            @lists[*args.join(" ")] = List.new(*args.join(" "))
        when "ls"
            @lists.each_key do |key|
                puts key
            end
        when "showall"
            @lists.each_key do |key|
                @lists[key].print
            end
        when "mktodo"
            label = args[0].to_s
            title = args[1].to_s
            deadline = args[2].to_s
            opt_desc = args[3..-1].join(" ")
            opt_desc = "" if opt_desc.nil?
            @lists[label].add_item(title, deadline, opt_desc)
        when "up"
        index = args[1].to_i
        amount = args[2].to_i
        amount = 1 if args[2].nil?
            @lists[args[0].to_s].up(index, amount)
        when "down"
            index = args[1].to_i
            amount = args[2].to_i
            amount = 1 if args[2].nil?
            @lists[args[0].to_s].down(index, amonut)
        when "swap" 
            @lists[args[0].to_s].swap(args[1].to_i, args[2].to_i)
        when "sort"
            @lists[args[0].to_s].sort_by_date!
        when "toggle"
            @lists[args[0].to_s].toggle_item(args[1].to_i)
        when "priority"
            @lists[args[0].to_s].print_priority
        when "print"
            if args[1].nil?
            @lists[args[0].to_s].print
            else
            @lists[args[0].to_s].print_full_item(args[1].to_i)
            end
        when "rm"
            @lists[args[0].to_s].remove_item(args[0].to_i)
        when "purge"
            @lists[args[0].to_s].purge
        when "quit"
            puts "Till next time!"
            return false
        else
            puts "Sorry, command not valid. Try $help to see all available commands."
        end
        true
    end

    def run
        until get_command == false
            get_command
        end
    end
end