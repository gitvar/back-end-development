# question_1.rb
# Hashes are commonly found to be more complex than the simple one we saw earlier:
#
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# It is often the case that each key points to another hash instead of a single value:
# Figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

# My answer:
male_ages = 0
munsters.each_value do |info|
  male_ages += info["age"] if info["gender"] == "male"
end

p male_ages

# Launch school Answer:
total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end
p total_male_age
