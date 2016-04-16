advice = "Few things in life are as important as house training your pet dinosaur."

arr = advice.split(' ')
arr.each_with_index { |word, idx| arr[idx] = "urgent" if word == "important" }
p advice = arr.join(" ")
