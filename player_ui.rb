puts "Welcome to Yacht Dice!\n\n"
puts "Please enter a number of players!"
number_of_player=gets.chomp
init_player= Init.new(number_of_player)
die =Die.new
game = Game.new(players)
until game.over?
  players.each do|player|
    puts "\n#{player.name}, your turn.\n"
    turn = Turn.new(player)
    player_choice =nil
    until turn.over?
      turn.roll(die)
      puts "You rolled a #{die.roll}."
      unless turn.over?
        puts "So far this turn, you have #{turn.points} points."
        puts "Press 'h' to hold or any other key to roll again."
        player_choice = gets.chomp
        turn.hold if player_choice =='h'
      end
    end
    puts "You got #{turn.points} points this turn."
    puts "You have #{player.points} points total.\n"
  end
end

puts "Congratulations, #{game.winner.name}. You win!"
