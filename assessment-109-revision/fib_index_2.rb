system 'clear'

array = (0..50).to_a

def fibonacci(num)
  if num < 2
    num
  else
    fibonacci(num - 2) + fibonacci(num - 1)
  end
end

fibonacci_sequence = []
30.times { |n| fibonacci_sequence << fibonacci(n) }

fib_array = []
array.each_with_index { |element, index| fib_array << element if fibonacci_sequence.include?(index) }

p fib_array
puts