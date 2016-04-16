ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if there is an age present for "Spot".

p ages.include?("Spot")
p ages.has_key?("Spot")
p ages.key?("Spot")

# => All return false!
