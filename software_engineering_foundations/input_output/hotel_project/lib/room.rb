class Room
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def total_occupants
    @occupants.length
  end

  def full?
    @capacity == self.total_occupants
  end

  def available_space
    @capacity - self.total_occupants
  end

  def add_occupant(name)
    if self.full?
      false
    else
      @occupants << name
      true
    end
  end
end
