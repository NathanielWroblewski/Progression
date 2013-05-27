require './assets/squares'
require './assets/board'
require './assets/turns'
require './assets/validation'
require './assets/move'


@checkmate = false

puts "\n"
puts "Welcome to Ruby Chess!"
puts "\n"
puts "Uppercase letters are the White Army."
puts "Lowercase letters are the Black Army."
puts "\n"

until @checkmate == true
  white_turn
  black_turn if @checkmate != true
end