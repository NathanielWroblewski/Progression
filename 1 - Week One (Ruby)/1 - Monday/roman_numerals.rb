# We're going to write a method that converts an integer to its Roman numeral equivalent, i.e., 476 => 'CDLXXVI'.

# For reference, these are the building blocks for how we encode numbers with Roman numerals:

# I   1
# V   5
# X   10
# L   50
# C   100
# D   500
# M   1000
# Roman Numerals as Representation
# Have you ever seen a 5? I don't mean the symbol we write on a piece of paper or print to a screen, but an actual, honest-to-goodness 5?

# Of course not. You've seen things that somehow embody five: five apples, five fingers, five weekdays on the calendar, a scrap of paper with "5" written on it, and so forth. Think of all the ways you can represent the integer 5.

# Symbols like 5, "five", V, and IIIII are one way. If you asked a three-year-old, they might hold up the five fingers on their hand or pull out five pennies from their pocket. Computers encode numbers as a sequence of 0s and 1s called binary.

# The map is not the territory, as they say.

# Objectives
# Old-school Roman numerals
# In the early days of Roman numerals, the Roman's didn't bother with any of this new-fangled subtraction 'IX' nonsense. No sir, it was straight addition, biggest to littlest--so 9 was written 'VIIII' and so on.

# Write a method to_roman that when passed an integer between 1 and 3000 (or so) returns a string containing the proper old-school Roman numeral.

# In other words, to_roman(4) should return the string 'IIII'.

# Make sure to test your method by passing it several inputs whose results you know. Test some simple numbers like to_roman(1) and more complicated numbers like to_roman(1646). This serves as a good sanity check.

# Hint: Use the integer division / and modulus % methods.

# Modern Roman numerals
# Eventually, someone thought it would be terribly clever if putting a smaller number before a larger one meant you had to subtract the smaller one. As a result of this development, you must now suffer.

# Rewrite your previous method to return the new-style Roman numerals so when someone calls to_roman(4), it should return the string 'IV'. You might want to run a script like this to make sure your program is working as intended:

# puts "My totally sweet testing script"
# puts ""
# puts "input | expected | actual"
# puts "------|----------|-------"
# puts "4     | IV       | #{to_roman(4)}"
# puts "9     | IX       | #{to_roman(9)}"
# puts "13    | XIII     | #{to_roman(13)}"
# puts "1453  | MCDLIII  | #{to_roman(1453)}"
# puts "1646  | MDCXLVI  | #{to_roman(1646)}"
# Examples

# Arabic      Roman
#      4         IV
#      9         IX
#     14        XIV
#     44       XLIV
#    944     CMXLIV
# Roman Numerals vs. Arabic Numerals: Pros and Cons
# Reflect for a second on the pros and cons of each representation. Imagine you're an engineer building a system for people to manipulate numbers and you have two proposals before you: use Roman numerals or use the Arabic numerals we use today. How do you decide and why?

# What benefits do Arabic numerals have over Roman numerals as a way to represent numbers? For example, with Arabic numerals we have an obvious way to represent 0. Arabic numerals also typically require fewer characters to represent the same number, e.g., "3111" vs "MMMCXI".

# What else? This is a useful exercise in understanding the relationship between how you represent your data and the actions you want to perform on your data — a dynamic you'll see at play in almost every piece of software you write.

# For example, if we're counting people as they walk into a room by marking something on a piece of paper, Arabic numerals are a terrible representation. That'd be like trying to go for a hike and using a political map as a guide.

# Instead, we opt for using tally marks to count.

def to_roman(num)
  roman_to_num = { "M"  => 1_000,
                   "CM" => 900,
                   "D"  => 500,
                   "CD" => 400,
                   "C"  => 100,
                   "XC" => 90,
                   "L"  => 50,
                   "XL" => 40,
                   "X"  => 10,
                   "IX" => 9,
                   "V"  => 5,
                   "IV" => 4,
                   "I"  => 1 }
  return "" if num == 0
  roman_to_num.map { |roman, int| return roman + to_roman(num - int) if num >= int }
end
 
# Drive code... this should print out trues.
 
puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"