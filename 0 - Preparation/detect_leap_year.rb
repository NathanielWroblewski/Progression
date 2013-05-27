# Exercise: Detecting leap years
# Create a method leap_year? that accepts an integer representing a year as input.

# It should return true if the year input is a leap year and false otherwise.

# For example,

# leap_year?(2000) # => true
# leap_year?(2001) # => false

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0
end