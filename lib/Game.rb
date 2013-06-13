class Game
    attr_reader :times
  def initialize
    @times=1
  end
  def over?
    @times > 4
  end
  def times_up
    @times += 1
    puts
  end

  def winner(players)
    win=players.max_by {|player| player.points}
    puts "Congratulations, #{win.name}. You win!"
    puts "You score is #{win.points}"
    puts "\nTABLE OF THE GAME\n
| Player |  Points  |"
    players.each{|player| puts "| #{player.name}  | #{player.points}  |"}
  end
end