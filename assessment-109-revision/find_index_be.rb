# Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |word| word.match("Be") }
p flintstones.index { |name| name[0, 2] == "Be" }
