# question_4.rb
#
# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

# My Answer:
# my_string = 'rutabaga' # .gsub!() mutates the caller. *Correct*
# my_array = ['pumpkins', 'rutabaga'] # []= mutates the caller. *Wrong!*
# above line is not []= with index but simple '=' which does NOT mutate the caller!
# my_array = ["pumpkins"]

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# As before, the explanation is all about what Ruby does with its internal variables when we change the object it points to. Does it create a new one? Or is it able to just modify the existing object?
#
# With the Array#= assignment, our literal ['pumpkins', 'rutabaga'] array IS a new object, and we are setting the internal array variable equal to that new array literal object.
