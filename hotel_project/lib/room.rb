class Room
  def initialize(num)
    @capacity = num
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    return false if @occupants.length < @capacity
    true
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(name)
        if !self.full?
            @occupants << name
            return true
        else
            false
    end
  end
end