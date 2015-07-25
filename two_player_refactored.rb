# require 'pry'

# players = [
# 	{
# 		name: "Jill",
# 		score: 0,
# 		life: 3,
# 	},

# 	{
# 		name: "Judy",
# 		score: 0,
# 		life: 3,
# 	}
# ]

# def generate_random_number
# 	rand(20)
# end

# def player_name(input)
# 	input.select do |player|
# 		puts player[:name]
# 	end
# end



life_count1 = 3
life_count2 = 3

def generate_random_number
	rand(20)
end

turn = 0
game_on = true
while game_on 
	if turn.even?
		num1 = generate_random_number
		num2 = generate_random_number
		answer = num1 + num2
		puts "Player 1: What is #{num1} plus #{num2}?"
		input = gets.chomp.to_i
		if answer == input
			turn += 1
		else
			life_count1 -= 1
			puts "You have #{life_count1} lives left"
			if life_count1 == 0
				game_on = false
				puts "Game over :("
			else
				turn += 1
			end
		end
	else
		num1 = generate_random_number
		num2 = generate_random_number
		answer = num1 + num2
		puts "Player 2: What is #{num1} plus #{num2}?"
		input = gets.chomp.to_i
		if answer == input
			turn += 1
		else
			life_count2 -= 1
			puts "You have #{life_count2} lives left"
			if life_count2 == 0
				game_on = false
				puts "Game over :("
			else
				turn += 1
			end
		end
	end
end
