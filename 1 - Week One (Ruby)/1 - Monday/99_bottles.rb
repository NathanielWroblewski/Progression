# Ah, good old 99 Bottles of Beer. You know the song right? It goes something like this...

# 99 bottles of beer on the wall, 99 bottles of beer.
# Take one down, pass it around, 98 bottles of beer on the wall!
# 98 bottles of beer on the wall, 99 bottles of beer.
# Take one down, pass it around, 97 bottles of beer on the wall!

# ... and so on...

# 1 bottle of beer on the wall, 1 bottle of beer.
# Take one down, pass it around, no more bottles of beer on the wall!
# We're going to write a bottle_song method which models someone singing this song by printing the lyrics to the console!

# In our virtual beer hall, calling bottle_song(99) represents you asking your rowdy neighbor to start singing 99 bottles of beer, and printing a line to the console represents that neighbor singing that line.

# Learning Goals
# Console output via puts, print, and other methods
# Looping with Integer#downto
# Optionally: simple recursion
# Objectives
# Sing it, any number of times
# Write a method bottle_song which takes as its input a positive integer n representing the number of starting bottles in the song. Pick a reasonable format and print out all the lines to the song.

# For example, bottle_song(500) starts with the stanza

# 500 bottles of beer on the wall, 500 bottles of beer.
# Take one down, pass it around, 499 bottles of beer on the wall!
# Sing it, recursively
# Optionally, can you write a recursive version of bottle_song? If you the muse calls, write a bottle_song_recursive method that has the same output as bottle_song.

# After you're done, ask yourself...
# Are there lots of special cases in my code? Can I isolate those special cases by creating new helper methods?
# Did I pay attention to the fact that the last two stanzas contain "1 bottle of beer" and "no more bottles of beer," respectively?
# If not, can I modify my code to handle those cases without making the code a rat's nest of conditionals?

def bottle_song(number)
  number.downto(1).each do |num|
    bottlez = (num == 1 ? "bottle" : "bottles")
    nextbottlez = ((num - 1) == 1 ? "bottle" : "bottles")
    nextnumber = ((num - 1) == 0 ? "no more" : num - 1)
    puts "#{num} #{bottlez} of beer on the wall, #{num} #{bottlez} of beer."
    puts "Take one down, pass it around, #{nextnumber} #{nextbottlez} of beer on the wall!"
  end
end
 
def bottle_song_recursive(num)
  return if num.zero?
  bottlez = (num == 1 ? "bottle" : "bottles")
  nextbottlez = ((num - 1) == 1 ? "bottle" : "bottles")
  nextnumber = ((num - 1) == 0 ? "no more" : num - 1)
  puts "#{num} #{bottlez} of beer on the wall, #{num} #{bottlez} of beer."
  puts "Take one down, pass it around, #{nextnumber} #{nextbottlez} of beer on the wall!"
  num -= 1
  bottle_song_recursive(num)
end