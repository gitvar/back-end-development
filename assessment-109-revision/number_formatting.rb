# number_formatting.rb

number = 123.23658
answer = format('%.2f', number)
puts "Here is the number: $#{answer}"

# => Here is the number: $   12354.24

a = 10
def m1
  a = 3
end
puts m1
puts a

a = 5        # variable is initialized in the outer scope
3.times do |n|
  a = 3      # is a accessible here, in an inner scope?
end
puts a
