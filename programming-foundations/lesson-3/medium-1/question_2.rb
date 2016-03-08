# question_2.rb

#Create a hash that expresses the frequency with which each letter occurs in this string:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# Launch School Answer:
statement = "The Flintstones Rock!"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
p result

# My Answer:
statement = "The Flintstones Rock!"
statement = "S0m3 R@nd0m ch4r@cters!!!"
frequency = {}
statement.length.times do |index|
  character = statement[index]
  frequency[character] = statement.scan(character).count unless character == ' '
end
p frequency
