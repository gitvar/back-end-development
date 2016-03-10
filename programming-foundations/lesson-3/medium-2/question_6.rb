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

# Only way to really make this method NOT mutate the caller - with serialisation.
def mess_with_demographics(m_hash)
  serialized_data = Marshal.dump(m_hash)
  demo_hash = Marshal.load(serialized_data)

  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
return demo_hash
end

def mess_with_demographics!(m_hash)
  m_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
puts "Initial Value: #{munsters}"
puts "Return of non-bang method: #{mess_with_demographics(munsters)}"
puts "After non-bang method: #{munsters}"
mess_with_demographics!(munsters)
puts "After call to bang method: #{munsters}"

# Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? (why?)

# Answer: WRONG*** Local copy mutated. Assignment inside mess_with_demographics method results in new varaible to be created, thereby not affecting the original data. ***WRONG

# Short answer: []= mutates the caller.

# Launch School Answer:
# Why? Remember that in Ruby, what gets passed in the parameter list is not what it appears. Under the hood, ruby passes the object id of each item rather than the value of the parameter. The method internally stores these object id's in locally scoped (private to the method) variables (named per the method definition's parameter list).
#
# So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up replacing that with some other object id and then the family's data would be safe.
#
# In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.
