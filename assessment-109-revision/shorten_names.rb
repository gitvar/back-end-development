# Using array#map!, shorten each of these names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |word| word[0..2] }
p flintstones
# ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]
