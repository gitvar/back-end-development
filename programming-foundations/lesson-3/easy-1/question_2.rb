# question_2.rb

# Describe the difference between ! and ? in Ruby.
# ================================================

# !: When used with a method, eg. 'calculate_results!(parameters)', is used to show that something unexpected will happen - usually indicating that the method will mutate the caller. This means the method will most likely change the parameter passed to it on a global scale and not just locally. But always check the method implementation!

# It can also indicate 'NOT' (opposite in boolean). For example: if !open ... (indicating that if the boolean variable 'open' is false, the rest of the if statement will be executed).
# Can also be used as 'not equal to' symbol: if variable_1 != 10 ...

# !!: This can be placed in front of a return variable (at the end of a method) to force the method to return true or false.
#     See also the note below (same thing but not just return varaibles): Double Not. !!username [true -> false - > true].

# ?: When used with a method eg. 'light_is_on?(light_1)'. it indicates that the method will/should return a boolean value (true or false). 
#    These type of methods should also NOT change any program variables. just return true or false.

1. what is != and where should you use it?
'Signify "not equal to". Use in if statement:'
  if varaible_1 != variable_2
    puts 'They are equal!'
  else
    puts 'Not equal'
  end

2. put ! before something, like !user_name
'Boolean NOT: result is opposit of what user_name was. If it was true, it will return false and vica versa. Valid for boolean variables'

3. put ! after something, like words.uniq!
'Will return array words with all duplicates taken out. Array words will be mutated/changed.'

4. put ? before something
?

5. put ? after something
'When used with a method eg. 'light_is_on?(light_1)'. it indicates that the method will/should return a boolean value (true or false).'

6. put !! before something, like !!user_name
'Double NOT. If user_name -> true, !!user_name -> true as well (true -> false -> true)'

# Official Answer:

Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

    != means "not equals"
    ? : is the ternary operator for if...else
    !!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
    !<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.
