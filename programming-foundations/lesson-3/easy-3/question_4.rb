# question_4.rb
#
# Shorten this sentence:
#
# advice = "Few things in life are as important as house training your pet dinosaur."
#
# ...remove everything starting from "house".
#
# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".
#
# As a bonus, what happens if you use the String#slice method instead?

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!("Few things in life are as important as ")
p advice

# if .slice is used and not .slice! then advice is not changed/mutated.
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice("Few things in life are as important as ")
p advice

# Launch School Answer:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index('house'))
p advice
