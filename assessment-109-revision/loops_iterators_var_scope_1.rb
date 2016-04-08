# loops_iterators_var_scope_1.rb

# Test loop do block re. local vars:

a = 1
arr = [1, 2, 3, 4, 5]

for i in arr do  # FOR does not have inner scope!
  puts "a = #{a}"
  puts "i = #{i}"
  a += 1
  b = a
end

puts "Out of for loop:"
puts "a = #{a}"
puts "b = #{b}"

puts " --------------------------"

a = 1

(1..5).each do |n| # RANGE does not have inner scope!
  puts n
  a = n
  b = a
end

puts "Out of range loop:"
puts "a = #{a}"
puts "b = #{b}"
