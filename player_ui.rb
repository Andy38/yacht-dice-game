require './lib/Init'
require './lib/Player'
require './lib/Game'
require './lib/Die'
require './lib/Turn'

puts "Welcome to Yacht Dice!\n\n"
puts "Please enter a number of players!"
number_of_players=gets.chomp.to_i
init = Init.new(number_of_players)
die=Die.new
game=Game.new
until game.over?
  init.array_of_players.each { |player|
    puts "\nPlayer #{player.name} you turn"
    turn=Turn.new(player)
    until turn.over?
      turn.roll(die)
      unless turn.over?
        puts "You have #{player.try} try to threw again"
        puts "Press 'r' to roll again or another button to continue."
        player_choice = gets.chomp
        if player_choice != 'r' or player.try == 0
          turn.hold
        else
          turn.continue
        end
      end
    end
  }
  game.times_up
end
game.winner(init.array_of_players)