# Exercise: Reverse words
# Write a method reverse_words which takes a sentence as a string and reverse each word in it.

def reverse_words(str)
  str.reverse.split.reverse.join(" ")
end