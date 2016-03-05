# question_10.rb

# Turn this array into a hash where the names are the keys and the values are the positions in the array.

# Method 1:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint_hash = {}

flintstones.each do |element|
  flint_hash.merge!({ element => flintstones.index(element) })
end
p flint_hash


# Method 2:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
interim_array = [0, 1, 2, 3, 4, 5]
flint_hash = {}

flint_hash = flintstones.zip(interim_array).to_h
p flint_hash

# Launch School's better solution:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint_hash = {}

flintstones.each_with_index do |element, i|
  flint_hash[element] = i
end
p flint_hash
