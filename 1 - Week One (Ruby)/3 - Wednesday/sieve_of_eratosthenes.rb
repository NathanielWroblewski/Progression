# In this challenge, we'll be implementing a much more sophisticated version of our previous prime_factors function using one of the oldest algorithms know, the Sieve of Eratosthenes.

# To get the prime factors of n your old method probably checks all the integers p within 1 < p <= sqrt(n). That's doing a bunch of extra work. For example, you'll be checking whether 3, 6, 9, 12, 15, etc. all divide your input. Once you know 3 is prime you shouldn't need to check whether 6, 9, 12, or any multiple of 3 divide your input because by definition no multiple of 3 will be prime.

# The Sieve of Eratosthenes works by iterating through the range of integers you care about and simultaneously ruling out large parts of that range. An image:



# Learning Goals
# This is a relatively advanced challenge and is the most sophisticated algorithm you've implemented yet, most likely. Focus on understanding the algorithm — Eratosthenes certainly did it on paper, and so should you!

# Objectives
# Implement the Sieve of Eratosthenes
# Write a method erastothenes_sieve which takes as its input an integer n and returns all prime numbers p such that 1 < p <= n.

# Refactor prime_factors
# Refactor your prime_factors implementation to take advantage of the Sieve of Eratosthenes.

def eratosthenes_sieve(n)
  multiples = []
  primes = []
  2.upto(n).each do |num|
    unless multiples.include? (num)
      2.upto(n).each do |number|
        multiples << num * number
        break if num * number > n
      end
      primes << num if n % num  == 0
      multiples.uniq!
    end
  end
  primes
end
 
def prime_factors(number, array = [])
  return if number == 1
  2.upto(number).each do |num|
    if number % num == 0
      number /= num
      array << num
    else
    end
  end
  prime_factors(number, array)
  array
end
 
 
###############################################
 
p prime_factors(4)
p prime_factors(7)
p prime_factors(35)
 
eratosthenes_sieve(4)
eratosthenes_sieve(7)
eratosthenes_sieve(35)