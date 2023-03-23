require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(instance)
        puts @secret_code.num_exact_matches(instance)
        puts @secret_code.num_near_matches(instance)
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess = gets.chomp
        guess_s = Code.from_string(guess)
        print_matches(guess_s)
        @secret_code == guess_s
    end
end
