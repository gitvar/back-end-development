# question_1.rb
# For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
#
# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

string = 'The Flintstones Rock!'
10.times { puts string = string.insert(0, ' ') }

# Launch School Answer:
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
