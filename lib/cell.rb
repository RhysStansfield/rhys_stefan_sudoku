class Cell

  def initialize value
    @value = value
    candidates_set_up
  end

  def candidates_set_up
     if @value == 0
      @candidates = (1..9).to_a
    else
      @candidates = nil
    end
  end   

  def value
    @value
  end

  def value_assignment
    @value = candidates.pop
  end

  def candidates
    @candidates
  end

  def candidate_count
    candidates.count
  end

  def ready_to_assign
    value_assignment if candidate_count == 1
  end

end