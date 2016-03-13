# question_1.rb

# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

p greeting
p holiday
# My answer:
# Ruby will complain and say "no such variable". WRONG!
# -> nil, compiler knows about the variable greeting but it has no value yet. Not yet assigned, but it is defined.

# Launch School Answer:
# 
