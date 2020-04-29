require_relative 'progression'
require_relative 'progression_proposer'

class AverageProgressionProposer < ProgressionProposer

  def self.propose(states, thres)
    vthres = (states.length * thres).to_i
    progressions = []

    (vthres..states.length-1).to_a.each do |idx|
      progressions << states[idx].difference(states[idx-1])
    end

    average_progressions(progressions)
  end

  private

  def self.average_progressions(progressions)
    sum = progressions.map(&:beta).reduce(:+)
    beta = sum / (progressions.length.to_f)

    sum = progressions.map(&:gamma).reduce(:+)
    gamma = sum / (progressions.length.to_f)

    Progression.new(beta, gamma)
  end
end
