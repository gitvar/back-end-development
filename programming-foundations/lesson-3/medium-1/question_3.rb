# question_3.rb

# In the previous exercise we added Dino to our array like this:
#
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"
#
# We could have used either Array#concat or Array#push to add Dino to the family.
#
# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# 1:
puts "the value of 40 + 2 is " + (40 + 2).to_s

# 2:
puts "the value of 40 + 2 is #{(40 + 2)}"
