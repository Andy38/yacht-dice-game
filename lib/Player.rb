class Player
  attr_reader :name, :points
  attr_accessor :try, :previous_rolls
  def initialize(name)
    @name = name
    @points = 0
    @try=2
    @previous_rolls=["00000"]
  end
  def add_points(new_points)
    @points += new_points
    puts "Your score at this turn is #{new_points}\n Total score is #{@points}"
  end
end