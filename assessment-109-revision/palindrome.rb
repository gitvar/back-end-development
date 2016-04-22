# palindrome.rb

possible_palindromes = %w(feet ears hand madam racecar eye)

def reverse_array(array)
  t_arr = []
  size = array.size - 1
  array.each_with_index do |element, index|
    t_arr[index] = array[size - index]
  end
  t_arr
end

def is_palindrome?(word)
  reverse_word = reverse_array(word.split('')).join
  word.eql?(reverse_word)
end

possible_palindromes.each do |str|
  puts "The string #{str} is a palindrome?: #{is_palindrome?(str)}"
end