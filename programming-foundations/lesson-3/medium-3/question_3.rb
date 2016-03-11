# question_3.rb

# Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.
#
# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

puts my_string = "pumpkins"
puts my_array = ["pumpkins"]
tricky_method(my_string, my_array)

# Answer: (Correct!)
# my_string = "pumpkins" : tricky_method uses the '=' operator, which does NOT mutate the caller.
# my_array = ["pumpkins", "rutabaga"] : tricky_method uses the shovel ('<<') method, which DOES mutates the caller.

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Launch School Anser:
# In both cases, Ruby passes the parameter "by value", but unlike some other languages, the value that gets passed is a reference to some object. The string parameter is passed to the method as a reference to an object of type String. Similarly, the array is passed to the method as a reference to an object of type Array.
#
# The important distinction is that while a reference is passed, the method makes up a new variable for both the string and the array, and puts these references in these new variables...these are variables that only live within the scope of the method.
#
# So if both parameters live inside the method as a new variable that stores a reference to the passed object...why don't the string and the array behave the same way in our output?
#
# The difference lies in what Ruby does when the program executes either a String#+= operation or an Array#<< operation.
#
# The string operation is re-assignment and CREATES A NEW STRING OBJECT. The reference to this new object is placed in the internal variable of the method, and the method considers this new string object to be the one true string. It has forgotten about the one that was passed in now. That old stale parameter string is still remembered by the caller of the method...but the method itself has forgotten all about it.
#
# With the array, one array object can have any number of elements. When we attach an additional element to an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it.
#
# So, because the method's array variable still points to the original object, the caller's array variable and the method's array variable are still pointing at the same object, and we see the results of what happened to the array "outside" of the method.
