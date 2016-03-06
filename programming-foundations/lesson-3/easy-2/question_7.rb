# question_7.rb
#
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include? "Dino"
p advice.include? "dinosaur" # Test

p advice.match("Dino")
