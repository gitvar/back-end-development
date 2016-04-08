
ha1 = { name: "Ben", surname: "Van", addr: "41 VCE" }
ha2 = { :name => "Ben", :surname => "Van", :addr => "41 VCE" }
p ha1

ha1.merge!({ seats: "regular", wheels: "mags" })

p ha1
puts ha2
puts ha1 == ha2

puts ha1[:name]
ha1.each { |k, v| puts "#{k} : #{v}" }
puts ha1.has_key?(:name)
arr1 =  ha1.select { |k, v| v } 
puts arr1