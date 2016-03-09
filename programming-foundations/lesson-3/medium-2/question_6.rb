# question_6.rb
#
# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

str = 'This is a string'
arr = ['This', 'is', 'an', 'array']

def my_tricky_method(a_string_param, an_array_param)
  a_string_param[0] += "r"
  an_array_param[0] += "rutabaga"
end

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? (why?)

# Answer: Local copy mangled. Assignment inside mess_with_demographics method results in new varaible to be created, thereby not affecting the original data.

my_tricky_method(str, arr)
p str, arr
p munsters

# I got this one completely wrong! Mainly because the method works directly on the data of the hash object passed in (no re-assignment takes place). As an example where re-assignment does take place, look at the non-bang tricky_method in exercise_3.rb (medium-2). Because of re-assignment (using the + method), a new object is created in memory space, with the variable pointing to that new memory space. Hence, the original is not changed or mutated.

# Launch School Answer:
# Why? Remember that in Ruby, what gets passed in the parameter list is not what it appears. Under the hood, ruby passes the object id of each item rather than the value of the parameter. The method internally stores these object id's in locally scoped (private to the method) variables (named per the method definition's parameter list).
#
# So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up replacing that with some other object id and then the family's data would be safe.
#
# In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.
