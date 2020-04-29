require_relative 'state'
require_relative 'simulation_factory'
require 'csv'

module App
  def self.run
		simulation = SimulationFactory.make(read_states, 0.2)

		puts simulation.run(1)[1]
  end

  private

  def self.read_states
    states = []

    CSV.foreach('./data/states.csv', headers: true) do |row|
      values = row.fields.map(&:to_i)
      states << State.new(*values)
    end

    states
  end
end

App.run
