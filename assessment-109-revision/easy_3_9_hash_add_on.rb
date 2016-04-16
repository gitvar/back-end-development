munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# "age_group" => "adult"

munsters.each do |_name, details|
  case details["age"]
  when (0..10)
    details["age_group"] = "kid"
  when (100..1000)
    details["age_group"] = "senior"
  when (11...100)
    details.merge!( { "age_group" => "adult"} )
  else
  end
end

p munsters
