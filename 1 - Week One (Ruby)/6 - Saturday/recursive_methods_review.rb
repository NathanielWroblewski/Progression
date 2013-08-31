# When you have a set of n people, how many ways are there to choose a team of k members, technically speaking, a k-element subset? I.e., if we have 18 students and need to make teams of 3, and never want students to be in the same exact team again, how many different combinations of teams can we create?

# Defining the Equation
# It's actually kind of complicated when you have a big group, even if we ignore ordering! Let's look at the formula for doing this:
# Let C(n,k) represent the number of ways to choose a team of k from a set of n.
# So, C(n,k) for the student teams example above would be: C(18,3).

# The simplest case would be when we are just having students work individually in teams of 1. How many teams of 1 can be created from a group of 18? This is simple. It's 18 teams of 1 of course! The formula would read: C(18,1) = 18. And in general, C(n,1) = n.

# But things get more complicated when you start making teams of 2. You can have all kinds of combinations of different people together. Luckily, this problem can be solved recursively!
# The general formula for C(n,k) is given by the recursive equation C(n,k) = C(n-1,k-1) + C(n-1,k).

# Keep in mind that if you try to create a team from zero people, there are zero ways to do this. IE C(0,k) = 0 because the number of ways to choose k people from 0 is 0.

# Use Ruby to solve the problem
# Write a recursive method called choose_team(n, k) that implements this formula and use this method to find how many ways there are to assign all 18 of you into pairs. (You may be quite surprised by this result). How about teams of 3?

# Here are a few values of C(n,k) that you can use to write tests for your code to verify your method works.

# C(6,2) = 15
# C(6,3) = 20
# C(24,4)= 10626
# Extra credit - can you explain why C(n,k) = C(n-1,k-1) + C(n-1,k)?

def choose_team(n,k)
  return n if k == 1
  return 0 if n == 0
  choose_team(n-1,k-1) + choose_team(n-1,k)
end