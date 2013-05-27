# Sort an array of words typed into the command line.

# It should work something like this

# $ ruby dictionary_sort.rb
# > Type a word:
# > hyperbole
# > Type another word (or press enter to finish):
# > fantasmagoria
# > Type another word (or press enter to finish):
# > xanthate
# > Type another word (or press enter to finish):
# > polysaccharide
# > Type another word (or press enter to finish):
# >
# > Congratulations! Your dictionary has 4 words:
# > fantasmagoria
# > hyperbole
# > polysaccharide
# > xanthate
# Make sure to test your program thoroughly, both internally and from the user interface.

# Source: Chris Pine, Learn to Program

# External Resources
# Learn about various Sorting Algorithms
# Learning Goals
# Work with user input
# Store and access data in a data structure (arrays)
# Understand different sorting algoritms
# Research Existing Ruby Methods using ruby docs.
# As you're coding, ask yourself ...
# What happens if the user inputs a number or an empty string?
# Objectives
# Store user input
# Write a program that asks the user to type as many words as they want (one word per line, continuing until they press Enter on an empty line).

# It should store those words in an array.

# Sort and print
# When the user presses Enter on an empty line, it should repeat the entered words back (print them to the console) in alphabetical order.

# It should ignore case for sorting: apple should come before Bear, and it should still print out the words in their original case.

def dictionary
  input_word = []
  loop do
    print "Type another word (or press enter to finish): "
    input = gets.chomp
    input = input.strip
    break if input == ""
    if input.scan(/\d/).empty? == false
      puts "Please enter only words."
    else
      input_word << input
    end
  end
  result = input_word.map { |word| word.downcase }
  puts "Congratulations! Your dictionary has #{result.length} words."
  puts result.sort.inspect
end