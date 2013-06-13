class Turn
  attr_reader :points, :over

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
    @dice = die.array_of_die.sort!
    index=[@dice.count(1),@dice.count(2),@dice.count(3),@dice.count(4),@dice.count(5),@dice.count(6)]
    if (index.count(1) >= 4 and (index[2] !=0 and index[3] !=0)) or (index.count(1) == 3 and (index.index(2)==2 or index.index(2)==3 ))
      @points = 30
      puts "You've just thrown a Small straight #{@dice.join(" ")}"
    elsif index.count(1)== 5 and (index[0]==0 or index[5]==0 )
      @points=50
      puts "You've just thrown Straight #{@dice.join(" ")}"
    elsif index.count(5)== 1
      @points = 40
      puts "You've just thrown \"YACHT\" #{@dice.join(" ")}"
    elsif index.count(4) == 1
      @dice.each{|one_die| @points += one_die}
      puts "You've just thrown 4 similar dice #{@dice.join(" ")}"
    elsif index.count(2)== 1 and index.count(3)== 1
      @points = 25
      puts "You've just thrown \"full house\" #{@dice.join(" ")}"
    elsif  index.count(3)== 1
      @points = (index.index(3)+1)*3
      puts "You've just thrown 3 similar dice #{@dice.join(" ")}"
    else
      @points=0
      puts "That's not a combination: #{@dice.join(" ")}"
    end
  end

  def hold
    @over = true
    @player.add_points(@points) if @player.previous_rolls.select { |rolls| rolls != @dice.join("") }.any?
    @player.previous_rolls << @dice.join("")
  end

  def continue
      @over = false
      @player.try -=1
  end
end