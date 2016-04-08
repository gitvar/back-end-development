hash1 = {:model=>"Golf", :make=>"Volswagen", :year=>1983, :colour=>"Green"}

hash1.each_key { |key| print " #{key} , " }
puts
hash1.each_value { |value| print " #{value} , "}
puts
hash1.each { |key, value| puts "key = #{key} with value = #{value}" }
puts
arr1 = hash1.keys
arr2 = hash1.values

p arr1
p arr2