# ...remove everything starting from "house":
advice = "Few things in life are as important as house training your pet dinosaur."

n = advice.index("house")
advice = advice[0...n]
p advice

advice = "Few things in life are as important as house training your pet dinosaur."
slice_off = advice.slice!(0, n)

p advice
p slice_off
