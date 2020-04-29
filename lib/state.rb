class State
  attr_accessor :n, :i, :ni, :day

  def initialize(n, i, ni, day)
    @n = n
    @i = i
    @ni = ni
    @day = day
  end

  def new_infective(progression)
    (@i * progression.beta * susceptible / @n) - new_non_infective(progression)
  end

  def new_non_infective(progression)
    (progression.gamma * @i)
  end

  # Calculating the following state given a progression.
  # Could be written as s2 = s1 + prog
  def next(progression)
    State.new(
      @n,
      (@i + new_infective(progression)).to_i,
      (@ni + new_non_infective(progression)).to_i,
      @day + 1
    )
  end

  # Calculating the progression that connects a state, given as a parameter, to the current state
  # Could be written as prog = s2-s1, where s2 = this and s1 = previous
  def difference(previous_state)
    #beta and gamma calculated by inverting the formula
    k = previous_state.i.to_f * previous_state.susceptible.to_f / n.to_f
    beta = ((@i - previous_state.i) + (@ni - previous_state.ni)) / k
    gamma = ((@ni - previous_state.ni) / (previous_state.i.to_f))

    Progression.new(beta, gamma)
  end

  # may be infected
  # calculated as the difference between the population and the sum of infective and
  # non infective
  def susceptible
    @n - @i - @ni
  end

  def hash_code
    prime = 31
    result = 1
    result = prime * result + day
    result = prime * result + i
    result = prime * result + n

    prime * result + ni
  end

  def to_s
    "State [n=#{@n}, i=#{@i}, ni=#{@ni}, day=#{@day}]"
  end
end
