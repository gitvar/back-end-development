# question_3_6.rb

# Relating to methods mutating the caller and not mutatingthe caller:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
end

def my_tricky_method(a_string_param, an_array_param)
  index = 3
  a_string_param[index] += "*-*"
  an_array_param[index] += "-*-"
end

my_string = "apples"
my_array = ["apples", "bananas", "oranges", "lemons"]
tricky_method(my_string, my_array)
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

my_string = "apples"
my_array = ["apples", "bananas", "oranges", "lemons"]
my_tricky_method(my_string, my_array)
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
