# Exercise: Fibonacci number
# Check, if a number i is part of the Fibonacci sequence.

def is_fibonacci?(i)
  a = 0; b = 1
  until b >= i
    c = b; b = b + a; a = c
  end
  i == b
end