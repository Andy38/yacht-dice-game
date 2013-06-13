class Turn
  attr_reader :points

  def initialize(player)
    @player = player
    @over = false
    @points = 0
  end

  def over?
    @over
  end

  def roll(die)
    die.roll!
    dice = die.array_of_die.sort!
    index=[dice.count(1),dice.count(2),dice.count(3),dice.count(4),dice.count(5),dice.count(6)]
    if (index.count(1) >= 4 and (index[2] !=0 and index[3] !=0)) or (index.count(1) == 3 and index.count(2)==1)
      @points = 30
      puts "You just rolled small Straight"
    elsif index.count(1)== 5 and (index[0]==0 or index[5]==0 )
      @points=50
      puts "Straight"
    elsif index.count(5)== 1
      @points = 40
      puts "5 similar"
    elsif index.count(4) == 1
      dice.each{|one_die| @points += one_die}
      puts "4 similar"
    elsif index.count(2)== 1 and index.count(3)== 1
      @points = 25
      puts "full house"
    elsif  index.count(3)== 1
      @points = index.index(3)*3
      puts "3 similar"
    else
      @puts "unlucky"
    end
  end

  def hold
    @over = true
    @player.add_points(@points)
  end
end