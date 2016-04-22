munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

# p munsters.values.select { |details| details["gender"] == "male" }.map { |details| details["age"] }.reduce(:+) 

total = 0
munsters.each do |_, value|
  total += value["age"] if value["gender"] == "male"
end

p total

p munsters.values.select { |hsh1| hsh1["gender"] == "male" }.map { |hsh2| hsh2["age"] }.reduce(:+)

total = 0
munsters.each do |_, hash|
  total += hash["age"] if hash["gender"] == "male"
end

p total