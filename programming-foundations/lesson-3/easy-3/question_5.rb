# question_5.rb
#
# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"
p statement.count "\\t"

# Or, to count the number of t's and T's:
p statement.count "\\tT"

# Launch School Answer:
p statement.scan('t').count

# scan returns am array consisting of the search term ('t' in this case), and .count is the array method, returning the number of elements in the array.

# Some test prints:
p statement.scan('t')
# => 2
p ['re', 'yy', 'cvfd'].count
# => 3
