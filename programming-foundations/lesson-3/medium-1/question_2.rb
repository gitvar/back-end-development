# question_2.rb

#Create a hash that expresses the frequency with which each letter occurs in this string:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
statement = "The Flintstones Rock"
frequency = {}
statement.length.times do |letter|
  key = statement[letter]
  frequency[key] = statement.scan(statement[letter]).count unless key == ' '
end
p frequency

puts

# Laumch School Answer:
statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
p result
