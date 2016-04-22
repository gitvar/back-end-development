
def str_reverse(str)
  r_array = []
  array = str.split('')
  size = array.size - 1

  array.each_index { |index| r_array[index] = array[size-index] }
  r_array.join('')
end

string1 = "Hello my fellow students!"
p string1
p str_reverse(string1)
