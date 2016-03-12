# question_3_6.rb

def prefix(str)
  "Mr " + str       # + does not mutate the caller.
end
def suffix(str)
  str << "son"      # << mutates the caller.
end
name = "John"
prefix(name)
puts name
suffix(name)
puts name


answer = 42
def mess_with_it(some_number)
  some_number += 8    # + and = do not mutate the caller.
end
new_answer = mess_with_it(answer)
p answer - 10
# Answer = 32.

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"      # = and + do not mutate the caller.
  an_array_param += ["rutabaga"]    # = and + do not mutate the caller,
end
def my_tricky_method(a_string_param, an_array_param)
  index = 1
  a_string_param[index] += "*-*"    # This is []= : Mutates the caller!
  an_array_param[index] += "-*-"    # This is []= : Mutates the caller!
end
my_string = "apples"
my_array = ["apples", "bananas"]
tricky_method(my_string, my_array)
puts "My string looks like this now: #{my_string}"    # "apples"
puts "My array looks like this now: #{my_array}"      # ["apples", "bananas"]
my_string = "apples"
my_array = ["apples", "bananas"]
my_tricky_method(my_string, my_array)
puts "My string looks like this now: #{my_string}"    # "ap*-*ples"
puts "My array looks like this now: #{my_array}"      # ["apples", "bananas-*-"]


def tricky_method2(a_string_param, an_array_param)
  a_string_param += "rutabaga"    # = and + do NOT mutate the caller.
  an_array_param << "rutabaga"    # << mutates the caller.
end
puts my_string = "pumpkins"
puts my_array = ["pumpkins"]
tricky_method2(my_string, my_array)
puts "My string looks like this now: #{my_string}"    # "pumpkins"
puts "My array looks like this now: #{my_array}"      # ["pumkins", "rutabaga"]


def tricky_method3(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end
my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method3(my_string, my_array)
puts "My string looks like this now: #{my_string}"    # .gsub! mutates caller. "rutabaga"
puts "My array looks like this now: #{my_array}"      # []= does NOT mutate. ["pumpkins"]

# My Answer:
# my_string = 'rutabaga' # .gsub!() mutates the caller. *Correct*
# my_array = ['pumpkins', 'rutabaga'] # []= mutates the caller. *Wrong!*
# above line is not []= with index but simple '=' which does NOT mutate the caller!
# my_array = ["pumpkins"]
