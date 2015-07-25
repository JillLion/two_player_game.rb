
@turn = 0
@answer = 0  # this makes sure this instance variable exists, 
			 # so that we can change it when we call it later 
			 # (ie. answer will never be 0 because we make answer 
			 # have a value between 1-40 in 'generate_question'

def toggle_turn
	if @turn == 0
		@turn = 1
	else
		@turn = 0
	end
end

def prompt
	puts "#{@players[@turn][:name]}, it is your turn: "
end

def generate_question
	a = rand(1..20)
	b = rand(1..20)
	@answer = a + b
	puts "What is #{a} + #{b}?"
end

def evaluate_input?(input)   #the question mark makes it clear that our method is returning a boolean
	if input == @answer
		puts "Correct!"
		@players[@turn][:score] += 1    # @players[@turn][:anykey] is a way to access 
		true							# the value of their hash -- also access the player whose turn it is!
	else
		@players[@turn][:life] -= 1 
		puts "Incorrect! Remaining lives: #{@players[@turn][:life]}"
		false                          # we want false to go last so it is the return (in our method for using in our while loop)
	end
end

@players = [
	{
		name: "Jill",
		score: 0,
		life: 3,
	},

	{
		name: "Judy",
		score: 0,
		life: 3,
	}
]

while @players[0][:life] > 0 && @players[1][:life] > 0
	prompt
	generate_question
	input = gets.chomp.to_i
	evaluate_input?(input)   # this 'evaluate_input(input)' is now a 
	toggle_turn				 # representation of the result of the (boolean) method 			# defined above, so it is either true or false
end

puts "#{@players[0][:name]}, your score is #{@players[0][:score]}"
puts "#{@players[1][:name]}, your score is #{@players[1][:score]}"