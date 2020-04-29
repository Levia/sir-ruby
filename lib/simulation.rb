class Simulation
  def initialize(start, progression=nil)
    @start = start
    @progression = progression
  end

  def run(days, progression=nil)
    unless progression
      run(days, @progression)
    else
      res = [@start]

      (1..days).to_a.each_with_index do |idx|
        res[idx] = res[idx-1].next(progression)
      end

      res
    end
  end
end
