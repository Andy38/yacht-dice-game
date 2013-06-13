class Die
  attr_reader :array_of_die
  def roll!
    @array_of_die=[rand(1..6),rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
  end
end
