# question_2.rb

# Add up all of the ages from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total = 0
ages.each { |_, value| total += value }
p total

# Launch School Answer:

p ages.values.inject(:+)

# This uses ages.values to make an array, then uses the inject method which is part of the Enumerable module which is included in Array -- it is wise to augment your knowledge of what you can do with arrays by studying Enumerable.
#
# The strange-looking parameter to inject is simply a variety of the inject method which says "apply the + operator to the accumulator and object parameters of inject".

# Some more ways from Enumerable: 
p ages.values.inject { |sum, n| sum + n }

p ages.values.reduce(:+)
