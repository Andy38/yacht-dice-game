class Init
  attr_reader :number_of_players
  attr_accessor :array_of_players
  def initialize(number_of_players)
    @number_of_players=number_of_players
    @array_of_players = []
    @count=1
    until @count > @number_of_players
      puts "Please enter name for Player #{@count}"
      name_of_player = gets.chomp
      @array_of_players << Player.new(name_of_player)
      @count+=1
    end
  end
end
