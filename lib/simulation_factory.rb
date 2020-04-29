require_relative 'average_progression_proposer'
require_relative 'simulation'

module SimulationFactory
  def self.make(states, thres, proposer=nil)
    unless proposer
      make(states, thres, AverageProgressionProposer)
    else
      Simulation.new(states[states.length-1], proposer.propose(states, thres))
    end
  end
end
