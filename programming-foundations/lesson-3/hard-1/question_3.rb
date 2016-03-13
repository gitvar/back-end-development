# question_3.rb

# In other exercises we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.
#
# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.
#
# What will be printed by each of these code groups?
#
# A)

def mess_with_vars1(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars1(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# My Answer:
# one
# two
# three

# B)

def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars2(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# My Answer:
# one
# two
# three


# C)

def mess_with_vars3(one, two, three)
  one.sub!("one","two")
  two.sub!("two","three")
  three.sub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# My Answer:
# two
# three
# one

# All Answers Correct!!!
