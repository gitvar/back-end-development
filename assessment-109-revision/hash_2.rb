hash1 = { model: "Golf", make: "Volswagen", year: 1985 }
hash2 = { year: 1984, colour: "Green" }

puts hash1.merge(hash2)

puts hash1.merge!(hash2) { |k, v1, v2| v1 - v2 }

