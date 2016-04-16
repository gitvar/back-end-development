# for each family member:
# (Name) is a (age) year old (male or female).
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}."
end

# Herman is a 32 year old male.
# Lily is a 30 year old female.
# Grandpa is a 402 year old male.
# Eddie is a 10 year old male.
# Marilyn is a 23 year old female.
