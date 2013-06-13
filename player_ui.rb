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
    puts "Player #{player.name} you turn"
    turn=Turn.new(player)
    until turn.over?
      turn.roll(die)
      unless turn.over?
        puts "Press 'h' to roll again.\n\n"
        player_choice = gets.chomp
        puts "You have #{player.try} try"
        turn.hold if player_choice != 'h'

    end}
end