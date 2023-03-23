class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.each do |char|
      return false if !POSSIBLE_PEGS.include?(char.upcase)
    end
    true
  end

  def initialize(pegs)
    if self.class.valid_pegs?(pegs) == false
      raise "Pegs not valid!"
    else
      @pegs = pegs.map { |char| char.upcase }
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    pegs = Array.new(length) { POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(pegs_str)
    Code.new(pegs_str.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0 
    (0..guess.pegs.length - 1).each do |i|
         if guess.pegs[i] == @pegs[i]
          count += 1
         end
      end
    return count
  end

  def num_near_matches(guess)
    count = 0 
    POSSIBLE_PEGS.each_key do |peg|
      self_count = @pegs.count(peg)
      guess_count = guess.pegs.count(peg)
      count += [self_count, guess_count].min
    end
    count - num_exact_matches(guess)
  end

  def ==(code)
    @pegs == code.pegs
  end

end
