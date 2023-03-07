class Game 

attr_accessor :current_player, :round_number

def initialize
    @current_player = nil
    @round_number = 0
    @player1 = nil
    @player2 = nil
end

def game_start
    puts "---Welcome to the Math-Game---"

    puts "________________________"
    
    puts "Player1 name:"
    player1 = Player.new(gets.chomp)
    @player1 = player1
    puts "Player2 name:"
    player2 = Player.new(gets.chomp)
    @player2 = player2
    puts "#{player1.name} vs #{player2.name}"

    @current_player = player2

    until @current_player.lives == 0 do
        new_round
    end
    
    game_over
    
end

def game_over
    puts "---Game over---"
    puts "-------------------------"
    change_current_player
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
    puts "-------------------------"
end

def change_current_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
end

def new_round
    @round_number += 1
    change_current_player
    new_question = Question.new
    puts "---Round #{@round_number}---"
    puts "#{@current_player.name}: #{new_question.question}"
    player_answer = gets.chomp.to_i

    if player_answer == new_question.answer
        puts "#{@current_player.name}: Yes,you are right!"
    else 
        puts "#{@current_player.name}: Nop,you are wrong!" 
        @current_player.lives -= 1
    end

    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"

end

end