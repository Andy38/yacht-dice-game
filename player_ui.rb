require './lib/Init'
require './lib/Player'

puts "Welcome to Yacht Dice!\n\n"
puts "Please enter a number of players!"
number_of_players=gets.chomp.to_i
init_players = Init.new(number_of_players)