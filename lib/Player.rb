class Player
  attr_reader :name, :points
  attr_accessor :try
  def initialize(name)
    @name = name
    @points = 0
    @try=2
    @hash={}
  end
  def add_points(new_points)
    @points += new_points
  end
end