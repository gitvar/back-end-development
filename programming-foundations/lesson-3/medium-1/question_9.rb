# question_9.rb
#
# Given the munsters hash below
#
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three infos describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below
#
# hash ={ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#         "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#         "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#         "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#         "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
#
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
#
# hint: try using a case statement along with Ruby Range objects in your solution

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |who, info|
  case info["age"]
  when 0..17
    info["age_group"] = "kid"
    p info
  when 18..64
    info["age_group"] = "adult"
    p info
  else
    info["age_group"] = "senior"
    p info
  end
end
