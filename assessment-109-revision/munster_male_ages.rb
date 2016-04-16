munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_male_age = 0
munsters.each do |age, details|
  total_male_age += details["age"] if details["gender"] == "male"
end
puts total_male_age

# OR

puts munsters.values.select { |hash| hash["gender"] == "male"  }.map { |hash| hash["age"] }.reduce(:+)
