# append_vs_concatenate.rb

# As discussed on the Launch School Beginning Ruby Live Session Part2:

# Look at different effects '<<' and '+' has on the outcome of teh code below:

def prefix(str)   # 'str' points to the same string, "John", as 'name' does (at he start of this method).
  "Mr " + str     # Ruby Docs: "str + other_str → new_str".
end               #   Note1: the '+' method returns a NEW string and does not change the original 'str' variable.
                  #   Note2: the NEW string "Mr John" now resides at a NEW address in memory.
                  #   Note3: 'str' and 'name' now point to different strings (objects).
                  #   Result: 'name' still points to "John" when this method returns.

def suffix(str)   # 'str' points to the same string, "John", as 'name' does (at he start of this method).
  str << "son"    # Ruby Docs: "str << obj → str".
end               #   Note: the '<<' method will 'mutate the caller' and return a changed 'str' string variable.
                  #   Result: When this method returns, 'name' will point to the changed string 'Johnson'.

name = "John"

# Question: How will the 'name' string be affected by the following method calls?

prefix(name)
puts name

suffix(name)
puts name

# $ ruby append_vs_concatenate.rb
# John
# Johnson

# Example as used in the lesson.

def a_method(param)
  # param << " Everybody!"
  param += " Universe!" # same as `param = param + " Universe!"`
  param = param + " Universe!"
  param << " World!"
end

str = "Hello"
p str
p a_method(str)
p str
