class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = [] 
    @secret_word.split("").each {|ele| @guess_word << "_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word 
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    @indices = []
    @secret_word.split("").each_with_index do |ele, idx|
      if ele == char
        @indices << idx 
      end
    end
      return @indices
  end

  def fill_indices(char, indices)
    indices.each do |i|
    @guess_word[i] = char
   end
  end

  def try_guess(char)
    indices = get_matching_indices(char)
    fill_indices(char, indices)
    if 
      !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end
    if already_attempted?(char) == true
      puts "that has already been attempted"
      return false
    elsif
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char: "
    guess = gets.chomp
    try_guess(guess)
  end

  def win? 
    if  @secret_word.split("") == @guess_word
      puts "WIN"
      return true
   else false
   end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      false
    end
  end

    def game_over?
      if self.win? == true || self.lose? == true
        puts @secret_word
        return true
      else 
        false
      end
     end


end
