# question_2.rb

# Question 2

# What is the result of the last line in the code below?
#
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
# informal_greeting = greetings[:a].clone
# informal_greeting = informal_greeting + ' there'
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# My Answer:
# Hi there
# Why? Because informal_greeting points to greetings[:a]. ' there' is then appended to that memory location, where both vars are pointing to. No re-assignment takes place.
# Remember '<<' modifies the caller.

# Launch School Answer:
# The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object. The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it. This means that the original object was changed, thereby impacting the value in greetings. If instead of modifying the original object, we wanted only modify informal_greeting but not greetings, there are a couple of options:
#
# -> we could initialize informal_greeting with a reference to a new object containing the same value by::
##  -> informal_greeting = greetings[:a].clone  ['.clone' does NOT mutates tha caller]

# -> we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.
##  -> informal_greeting = informal_greeting + ' there'  ['+' does not mutate the caller]

# def mutate(greetings, informal_greeting)
#   informal_greeting = greetings[:a]
#   # informal_greeting = greetings[:a].clone
#   # informal_greeting = informal_greeting + ' there'
#   informal_greeting << ' there'
# end
#
# informal_greeting = 'hello'
# greetings = { a: 'hi' }
# mutate(greetings, informal_greeting)
#
# puts informal_greeting
# puts greetings
