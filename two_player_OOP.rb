class Player
	attr_accessor :name, :score, :life		# NOTE: these are now accessible wherever, without using global variables
	def initialize(name)					# NOTE: don't need to pass score and life as arguments b/c they are set by default as 0 & 3
		@name = name
		@score = 0
		@life = 3
	end
end

class Game
	attr_accessor :player1, :player2, :current_turn, :input, :score, :life

	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		@current_turn = player1
	end

	def toggle_turn
		if @current_turn == @player1
			@current_turn = @player2
		else
			@current_turn = @player1
		end
	end

	def prompt
		puts "#{@current_turn.name}, it is your turn: "
	end

	def generate_question
		@@first_num = rand(1..20)
		@@second_num = rand(1..20)
		@answer = @@first_num + @@second_num
		puts "What is #{@@first_num} + #{@@second_num}?"
		@input = gets.chomp.to_i
	end

	def evaluate_input?  					# NOTE: the question mark makes it clear that our method is returning a boolean
		if @input == @answer
			puts "Correct!"
			@current_turn.score += 1    	# NOTE: @players[@curren_turn][:anykey] is a way to access 
			true							# the value of their hash -- also access the player whose turn it is!
		else
			@current_turn.life -= 1 
			puts "Incorrect! Remaining lives: #{@current_turn.life}"
			false                          	# NOTE: we want false to go last so it is the return (in our method for using in our while loop)
		end
	end
end

#These are new instances of the player class:
puts "Player One, what is your name?"  
name_given= gets.chomp
player1 = Player.new(name_given)

current_turn = player1        				 # NOTE: you don't need @current_turn (instance variable) because :current_turn is an attribute accessor passed to the class above

puts "Player Two, what is your name?"
name_given = gets.chomp
player2 = Player.new(name_given)

# This is a new instance of the Game class - GAME ON!
game1 = Game.new(player1, player2)         	 # NOTE:only need to give them these two arguments because that's what the initialize method requires

while player1.life > 0 && player2.life > 0   # NOTE: using .life is the way to access that variable & attribute (@life = 3) 
	game1.prompt							 # related/tied to the new instance of the Player class, which is player1
	game1.generate_question
	game1.evaluate_input?			   		 # NOTE: this 'evaluate_input(input)' is now a 
	game1.toggle_turn				 		 # representation of the result of the (boolean) method 			
end											 # defined above, so it is either true or false

puts "#{player1.name}, your score is #{player2.score}"
puts "#{player2.name}, your score is #{player2.score}"