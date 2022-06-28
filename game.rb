require './questions'
class Player
  attr_accessor :lives, :name
  def initialize(name)
    @name = name
    @lives = 3
  end
  def lose_life
    @lives -= 1
  end
  def dead?
    @lives == 0
  end
end
class Game
  attr_accessor :player1, :player2, :current_player, :game_over, :questions
  
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
    @other_player = @player2
    @game_over = false
    questions = @questions
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
      @other_player = @player1
    else
      @current_player = @player1
      @other_player = @player2
    end
  end

  def ask_question(questions)
    random_question = questions.keys.sample(1)
    puts questions[random_question[0]][:question]
    print "Answer:"
    answer = gets.chomp
    if answer == questions[random_question[0]][:answer]
      puts "Correct! You are spared this time."
    else
      @current_player.lose_life
      puts "Wrong! You lose a life. \n "
      puts "You have #{@current_player.lives} lives left."
    end
  end

  def play_game
    puts "Welcome to the game of Math!?!?!"
    puts "---Player 1's turn---"
    ask_question(Questions.questions)

    until @game_over
      if @current_player.dead?
        puts "#{@other_player.name} wins with the score of #{@other_player.lives}/3"
        puts "-----GAME OVER, #{@current_player.name} lose-----"
        @game_over = true
      else
        switch_players
        puts "-----#{current_player.name}'s turn-----"
        ask_question(Questions.questions)
      end
    end
  end
end