# An anagram is a word formed by rearranging the letters of another word, e.g., iceman is an anagram of cinema.

# Since this relationship is symmetric — X is an anagram of Y if and only if Y is an anagram of X — you'll often hear people say that, e.g., "iceman and cinema are anagrams" or "iceman and cinema are anagrams of each other." They all mean the same thing: you can rearrange the letters of one word to spell another.

# We're going to write a method is_anagram? that takes two strings as input and returns true if the two strings are anagrams and false otherwise.

# For now we won't care if the strings are valid English words or not.

# External Resources
# Anagram on Wikipedia
# Learning Goals
# Modeling a simple real-world procedure in Ruby
# Method definition, arguments, and return values
# Common string methods
# As you're coding, ask yourself...
# Do I have a clear understanding of how this procedure works?
# Am I stuck because I know what I want to do but don't know how to say it in Ruby?
# Am I stuck because my understanding of how anagrams work is to fuzzy or mistaken?
# Objectives
# Pseudocode Implementation of is_anagram?
# Before you start writing a single line of Ruby code, sit down and ask yourself, "Do I know how to tell whether two words are anagrams?"

# Your is_anagram? method will be a (digital, computerized, mechanical) model of the (analog, organic, human) process by which you determine whether two words are anagrams.

# Once you're confident that you can tell whether two words are anagrams, reflect on your own or with your pair about how that process works. Can you explain it to your pair in a way that they understand? How do you know whether they've understood you?

# If you can't explain it to another person, you'll have a hard time "explaining" it to a computer via Ruby code!

# Finally, write pseudocode that outlines your own mental procedure in a way that's easy for a human to both understand and translate into their favorite programming language.

# Note: If you have spent more than 20 minutes trying to figure out how to do this, check in with a fellow student or staff. There's a very simple way to implement this!

# Ruby Implementation of is_anagram?
# Write a method is_anagram? in Ruby that takes two strings as input and returns true if the two strings are anagrams and false otherwise. The method should be case insensitive. For example,

# # The method should be symmetric, i.e.,
# # is_anagram?(word1, word2) == is_anagram?(word2, word1) for any two words
# is_anagram?('cinema', 'iceman') # => true
# is_anagram?('iceman', 'cinema') # => true

# # Pedantically, a word is always an anagram of itself.
# # This is called being "reflexive," i.e., is_anagram?(word, word) == true for any word
# is_anagram?('pants', 'pants')   # => true

# # is_anagram? should be case-insensitive
# is_anagram?('CiNemA', 'iceman') # => true

# # Notice: acres, cares, and scare are all anagrams of each other
# is_anagram?('acres', 'cares')   # => true
# is_anagram?('cares', 'scare')   # => true
# is_anagram?('scare', 'acres')   # => true

# # The "words" don't need to be valid English words
# is_anagram('abcde2', 'c2abed')  # => true

# is_anagram?('pants', 'turtle')  # => false
# is_anagram?('123123', 'kjhasd') # => false
# After you're done, ask yourself...
# Is there a way to transform a word into a "canonical" representation such that two words have the same canonical representation precisely when they're anagrams of each other?
# That is, can you define a method canonical which lets us write is_anagram? like this?

# def canonical(word)
#   # Magic goes here
# end

# def is_anagram?(word1, word2)
#   canonical(word1) == canonical(word2)
# end
# Please include in the Gist: Why is adding the canonical method a good idea? What principles in programming does it follow?

# Solution for Challenge: Anagrams 1: Detecting Anagrams. Started 2013-04-24T22:08:04+00:00
 
def canonical(word)
  word.downcase.split(//).sort
end
 
def is_anagram?(word1, word2)
  canonical(word1) == canonical(word2)
end
 
# Driver code
puts is_anagram?("3ice.man","Cin3e.ma")
puts is_anagram?("icemana","Cinema")