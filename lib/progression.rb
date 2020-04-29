class Progression
  attr_accessor :beta, :gamma

  def initialize(beta, gamma)
    @beta = beta
    @gamma = gamma
  end

  def to_s
    "Progression [beta=#{@beta}, gamma=#{@gamma}]"
  end
end
