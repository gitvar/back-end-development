advice = "Few things in life are as important as house training your pet dinosaur."

words = advice.split(/\W/)

words.each_with_index do |word, index|
  if word == 'important'
    words[index] = 'urgent'
  end
end

p advice = words.join(' ')