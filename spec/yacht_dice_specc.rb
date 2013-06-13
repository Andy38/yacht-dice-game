require '../lib/Player'
require '../lib/Init'

puts "Test project"
#puts "Please enter a number of players!"
#number_of_players=gets.chomp.to_i
#init = Init.new(number_of_players)
#array_of_die=[rand(1..6),rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
#p dice = array_of_die.sort!
#dice =[1,2,3,4,6]
dice =[2,2,4,5,6]

p index=[dice.count(1),dice.count(2),dice.count(3),dice.count(4),dice.count(5),dice.count(6)]
points=0

if (index.count(1) >= 4 and (index[2] !=0 and index[3] !=0)) or (index.count(1) == 3 and index.count(2)==1)
  points = 30
  puts "You've just thrown Small straight #{dice.join(" ")}"
elsif index.count(1)== 5 and (index[0]==0 or index[5]==0 )
  points=50
  puts "Straight"
elsif index.count(5)== 1
  points = 40
  puts "5 similar"
elsif index.count(4) == 1
  dice.each{|one_die| points += one_die}
  puts "4 similar"
elsif index.count(2)== 1 and index.count(3)== 1
  points = 25
  puts "full house"
elsif  index.count(3)== 1
  points = index.index(3)*3
  puts "3 similar"
else
  puts "unlucky"
end
p points
#init.array_of_players.each{|player|
#puts "You have #{player.try} try"}


