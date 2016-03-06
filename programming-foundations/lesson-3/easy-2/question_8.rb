# question_8.rb
#
# In the array below. Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |string| string.start_with?("Be") }
p flintstones.index { |string| string[0,2] == "Be" }
p flintstones.index { |string| string.include?("Be") }

# p flintstones.index { |string| string[2,2] == "mB" }
# p flintstones.index("Betty"
