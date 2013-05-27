###Created by Nathaniel Wroblewski###

class Hangman
	def initialize(players = 0, word = nil, guesses = 6, lose_game = false, win_game = false)
		@word = word
		@players = players
		@guesses = guesses
		@good_guesses = []
		@poor_guesses = []
		@lose_game = lose_game
		@win_game = win_game
	end

  def word
    @word
  end

  def guesses_left
    @guesses
  end

  def bad_guess
    @poor_guesses
  end

	def intro
		puts "\n"
    puts " ____________________"
    puts "|  __________))______|"
    puts "| | / /      ||"
    puts "| |/ /       ||"
    puts "| | /        ||.---."
    puts "| |/         |/  _  \\"
    puts "| |          ||  `/,|"
    puts "| |          (\\\\\'_._/"
    puts "| |         .-`--\'."
    puts "| |        / Y. .Y\\"
    puts "| |       // |   | \\\\       Welcome to Ruby Hangman!"
    puts "| |      //  | . |  \\\\"
    puts "| |     ')   | _ |   (\`"
    puts "| |          || ||"
    puts "| |          || ||"
    puts "| |          || ||"
    puts "| |          || ||"
    puts "| |_______  / | | \\  ___"
    puts "| |_______| `-' `-' |   |"
    puts "| |                   | |"
    puts "| |                   | |"
    puts "| |                   | |\n"
  end

  def player_prompt
    answered = false
    while answered == false
      puts "\n\nEnter the number of players (1 or 2):"
      players = gets.chomp
      if players == "2"
        @players = 2
        answered = true
      elsif players == "1"
        @players = 1
        answered = true
      else
        puts "\n\nSorry, I didn't quite understand."
      end
    end
  end

  def word_prompt
    if @players == 2
      puts "\n\nPlease enter a word:"
      word = gets.chomp
      @word = word
      puts "\n" * 100
    elsif @players == 1
      word_bank = %w{ jalepeno catamaran jazz month zebra abruptly askew bandwagon buffalo daiquiri khaki mystify pizazz waltz zephyr rhythmic sequoia }
      @word = word_bank[rand(word_bank.length) - 1 ]
    end
  end

  def lose_game?
    @lose_game
  end

  def win_game?
    @win_game
  end

  def display_gallows
    case @guesses
    when 6
      puts "     _______ "
      puts "    |/      |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts " ___|___"

    when 5
      puts "     _______ "
      puts "    |/      |"
      puts "    |      (_)"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts " ___|___"

    when 4
      puts "     _______ "
      puts "    |/      |"
      puts "    |      (_)"
      puts "    |       |"
      puts "    |       |"
      puts "    |"
      puts "    |"
      puts " ___|___"

    when 3
      puts "     _______ "
      puts "    |/      |"
      puts "    |      (_)"
      puts "    |      \\|"
      puts "    |       |"
      puts "    |"
      puts "    |"
      puts " ___|___"

    when 2
      puts "     _______ "
      puts "    |/      |"
      puts "    |      (_)"
      puts "    |      \\|/"
      puts "    |       |"
      puts "    |"
      puts "    |"
      puts " ___|___"

    when 1
      puts "     _______ "
      puts "    |/      |"
      puts "    |      (_)"
      puts "    |      \\|/"
      puts "    |       |"
      puts "    |      / "
      puts "    |"
      puts " ___|___"

    when 0
      puts "     _______ "
      puts "    |/      |"
      puts "    |      (_)"
      puts "    |      \\|/"
      puts "    |       |"
      puts "    |      / \\"
      puts "    |"
      puts " ___|___"
    end
  end

  def display_word
    display_word = @word.split(//).map { |letter|
    if @good_guesses.include?(letter)
      letter
    else
      "_ "
    end
    }.join
    print "\nWord to guess: "
    print display_word
  end

  def display_remaining_alphabet
    alphabet = %w{ a b c d e f g h i j k l m n o p q r s t u v w x y z }
    remaining = alphabet.to_a - @good_guesses.to_a - @poor_guesses.to_a
    puts "\n\n"
    print "Remaining letters: "
    print remaining.each { |num| num }.join(" ")
  end

  def guess
  	puts "\n\nEnter a letter:"
  	response = gets.chomp
  	letter = response.downcase.scan(/[a-z]{1}/).join
    if @word.include?(letter) && @good_guesses.include?(letter)
      puts "\n***You have already guessed that letter.***"
    elsif @word.include?(letter) == false && @poor_guesses.include?(letter)
      puts "\n***You have already guessed that letter.***"
  	elsif @word.include?(letter) == false
  		@guesses -= 1
      @poor_guesses << letter
  	elsif @word.include?(letter)
  		@good_guesses << letter
  	else
  		abort
  	end
  end

  def check_word
    if @good_guesses.sort.uniq == @word.split(//).sort.uniq
      @win_game = true
    else
      @win_game = false
    end
    @win_game
  end

  def win_or_lose
  	@lose_game = true if @guesses == 0
  	display_gallows if @guesses == 0
    if @lose_game == true
    	puts "\nYou lose.  The word was \"#{@word}.\""
    	@lose_game
    elsif @win_game == true
      display_gallows
      display_word
    	puts "\nCongratulations!  You guessed the word \"#{@word}\"!"
    	@win_game
    else
    end
  end

  def play_again?
  	answered = false
  	while answered == false
  	  puts "\nPlay again? (Yes or No)"
  	  answer = gets.chomp
  	  if answer.downcase =~ /yes/
  	  	answered = true
  	  elsif answer.downcase =~ /no/
  	  	abort ("\nThank you for playing!\n")
  	  else
  	  	puts "\nSorry, I didn't quite understand."
  	  end
  	end
  end
end

run = true
until run == false
	newgame = Hangman.new
  newgame.intro
  newgame.player_prompt
  newgame.word_prompt
  while newgame.win_game? == false && newgame.lose_game? == false
	  newgame.display_gallows
	  newgame.display_word
    newgame.display_remaining_alphabet
	  newgame.guess
	  newgame.check_word
    newgame.win_or_lose
  end
  newgame.play_again?
end
