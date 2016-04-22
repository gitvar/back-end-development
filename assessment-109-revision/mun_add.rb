munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.values.each do |mhash|
  case 
  when mhash["age"] < 17
    mhash["age_group"] = "kid"
  when (18..64).include?(mhash["age"])
    mhash["age_group"] = "adult"
  when mhash["age"] > 64
    mhash["age_group"] = "senior"
  else
  end
end

p munsters
