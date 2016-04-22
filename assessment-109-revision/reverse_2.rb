# reverse_2.rb

def reverse_string(str)
  arr = str.split('')
  len = arr.size - 1

  reverse_arr = []
  arr.each_index { |index| reverse_arr << arr[len - index] }
  reverse_arr.join('')
end

string = "0123456789 10111213141516171819"
p reverse_string(string)