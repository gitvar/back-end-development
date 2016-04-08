# flow_control_3.rb

def reveal_num(n)
  case n
  when (0..50)
    "The number is between 0 and 50."
  when (51..100)
    "The number is between 51 and 100."
  else
    "Number out of range!"
  end
end

def reveal_num_2(n)
  return "number out of range!" if !(0..100).member?(n)
  return "The number is between 0 and 50." if (0..50).include?(n)
  return "The number is between 51 and 100." if (51..100) === n
end

system 'clear'
puts "Enter a number between 0 and 100:"
num = gets.chomp.to_i
puts reveal_num(num)
puts reveal_num_2(num)
