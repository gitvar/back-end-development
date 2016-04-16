flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.

h1 = {}
flintstones.each_with_index { |name, index| h1[name] = index }
p h1
