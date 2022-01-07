require './player.rb'
require './question.rb'

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def makeQuestion
    @newQuestion = Question.new
    puts "----- NEW TURN -----"
    if @player2.turn
      puts "Player 2: #{@newQuestion.newQuestion}"  
    else 
      puts "Player 1: #{@newQuestion.newQuestion}"  
    end
  end

  def checkAnswer
    if gets.chomp.to_i == @newQuestion.answer
      if @player2.turn
        puts "YES! You are correct."
        @player1.turn = true
        @player2.turn = false
        puts "Player 1: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
        checkWinner
      else
        puts "YES! You are correct."
        @player1.turn = false
        @player2.turn = true
        puts "Player 1: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
        checkWinner
      end
    else
      if @player2.turn
        @player2.lives -= 1
        puts "Seriously? No!"
        @player1.turn = true
        @player2.turn = false
        puts "Player 1: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
        checkWinner
      else
        @player1.lives -= 1
        puts "Seriously? No!"
        @player1.turn = false
        @player2.turn = true
        puts "Player 1: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
        checkWinner
      end    
    end
  end

  def checkWinner
    if @player2.lives == 0
      puts "Player 1 wins with a score of #{@player2.lives}/3 "
      puts "----- GAME OVER -----"
    elsif @player1.lives == 0
      puts "Player 2 wins with a score of #{@player1.lives}/3 "
      puts "----- GAME OVER -----"
    else
      anotherTurn
    end
  end

  def anotherTurn
    makeQuestion
    checkAnswer
  end
end