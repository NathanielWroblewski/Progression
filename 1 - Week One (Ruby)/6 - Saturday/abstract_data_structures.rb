# You have now worked extensively with the Array and Hash data structures, and learned a bit about Stack, Queue and Linked List. For this exercise you will delve deeper into another data structure of your choice.

# Choose an Abstract Data Structure from the list at http://en.wikipedia.org/wiki/List_of_data_structures (**not** Stack or Queue or Linked List), and do the following:

# Describe
# Describe the major functions of the data structure in your own words in 3 or 4 sentences.

# Implement
# Implement the data structure and its primary functionality using either an array or hash.

# Write test code to show how your implementation works. (Similar to what you saw in the Stack exercise).

# Get real
# Describe a 'real' programming problem that you would model with your data structure and how the model represents the problem situation without exposing unneccesary data or methods.

# 1. Describe
# A graph allows one data point to reference to many other data points, and those data points to also 
# reference several other data points.  They can loop back on each other or form complex associations.  
# Generally, with a graph, you can add nodes, delete nodes, see what they reference, and see if they are
# adjacent.
 
# ------------
# 2. Implement
class Graph
 
  def initialize
    @graph = {}
  end
 
  def add_node(value,*references)
    @graph[value] = references.join(', ')
    references.each do |reference|
      @graph[reference] == nil ? @graph[reference] = value : @graph[reference] += ", #{value}"
    end
  end
 
  def adjacent?(value1, value2)
    @graph[value1].include?(value2)
  end
 
  def print_graph
    p @graph
  end
 
  def list_neighbors(value)
    @graph[value]
  end
 
  def delete_node(value)
    @graph.each do |graphvalue, reference|
      reference.slice!(/, #{value}/)
      reference.slice!(value)
    end
    @graph.delete(value)
  end
end
 
######################################
 
g = Graph.new
g.add_node("California", "Oregon", "Nevada", "Arizona")
g.print_graph
p g.adjacent?("California", "Oregon")
g.add_node("Utah", "Nevada", "Idaho", "Wyoming", "Colorado", "New Mexico")
g.print_graph
p g.list_neighbors("California")
g.delete_node("California")
g.print_graph
 
 
# ------------
# 3. Get real
 
# My graph class above could be utilized to see continguous states.  California could be added as a node with
# neighbors like Oregon, Nevada, and Arizona.  The graph class makes the California node, references the other
# states, and then generates nodes for the other states and they reference back to California.  The class
# allows users to see if two states are contiguous, to see all neighbors of a node, and to delete a node.