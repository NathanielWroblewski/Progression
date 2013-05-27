# Exercise: Build a simple guessing game
# Create a GuessingGame class which is initialized with an integer called answer.

# Define an instance method GuessingGame#guess which takes an integer called guess as its input. guess should return the symbol :high if the guess is larger than the answer, :correct if the guess is equal to the answer, and :low if the guess is lower than the answer.

# Define an instance method GuessingGame#solved? which returns true if the most recent guess was correct and false otherwise.

class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def guess(guess)
    @guess = guess
    if guess > @answer
      :high
    elsif guess < @answer
      :low
    else guess == @answer
      :correct
    end
  end

  def solved?
    @guess == @answer
  end
end