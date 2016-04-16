flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

arr = []
flintstones.each do |name, num|
  if name == "Barney"
    arr << name
    arr << num
  end
end
p arr

arr = []
flintstones.each { |name, number| arr << [name, number] if name == "Barney"}
p arr.flatten

arr = flintstones.assoc("Barney")
p arr
