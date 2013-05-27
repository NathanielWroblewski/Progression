# Convert an integer into its English equivalent.

# Examples:

# in_words(4)         # => "four"
# in_words(27)        # => "twenty seven"
# in_words(102)       # => "one hundred two"
# in_words(38_079)    # => "thirty eight thousand seventy nine"
# in_words(82102713)  # => "eighty two million one hundred 
#                           two thousand seven hundred thirteen"
# Source: Chris Pine, Learn to Program

# Objectives
# Is it recursive?
# Is your method recursive? If not, make it recursive.

# Can you refactor your code in other ways to make it more concise and eloquent? Are there more efficient data structures you can use, like arrays or hashes?

# Ones and tens
# Start small: make it work for numbers 1 through 100.

# Up to one thousand
# Now bump up the meter: make it convert numbers up to 1000.

# Up to one million
# Change it again so that it will convert up to 1_000_000.

# Hint: in Ruby, you can use _ underscores in numbers as if they were commas - the value of the number stays the same, it is just a trick to make it more readable.

# How much higher?
# Now try adding billions, trillions, and so on. How high can you go?

def in_words(int)
  num_words = { 1_000_000 => "million",
                1_000 => "thousand",
                100 => "hundred",
                90 => "ninety",
                80 => "eighty",
                70 => "seventy",
                60 => "sixty",
                50 => "fifty",
                40 => "forty",
                30 => "thirty",
                20 => "twenty",
                19 => "nineteen",
                18 => "eighteen",
                17 => "seventeen",
                16 => "sixteen",
                15 => "fifteen",
                14 => "fourteen",
                13 => "thirteen",
                12 => "twelve",
                11 => "eleven",
                10 => "ten",
                9 => "nine",
                8 => "eight",
                7 => "seven",
                6 => "six",
                5 => "five",
                4 => "four",
                3 => "three",
                2 => "two",
                1 => "one" }
  
  return if int == 0
  string = ""
  num_words.each do |numkey,wordvalue|
    quotient = int / numkey
    string += in_words(quotient) if quotient >= 1 && int >= 100
    string += " #{wordvalue} " if quotient != 0
    int %= numkey
  end
  string
end