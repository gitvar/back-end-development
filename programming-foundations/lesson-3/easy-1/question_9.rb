# question_9.rb

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

# My answer:
barney = [ flintstones.key(2), flintstones["Barney"] ]
p barney

# Launch School's answer:
flintstones.assoc("Barney")
p barney
