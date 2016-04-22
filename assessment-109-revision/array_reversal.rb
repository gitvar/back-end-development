# reverse.rb

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def reverse_array(array)
  t_arr = []
  size = array.size - 1
  array.each_with_index do |element, index|
    t_arr[index] = array[size - index]
  end
  t_arr
end

my_arr = reverse_array(arr)
p arr
p my_arr
