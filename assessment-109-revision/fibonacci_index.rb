# fibonacci_index.rb

arr1 = ("aa".."zz").to_a

def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n-2) + fibonacci(n-1)
  end
end

def build_fibonacci
  fib_arr = []
  30.times { |n| fib_arr << fibonacci(n) }
  fib_arr
end

fibonacci_numbers = build_fibonacci

arr2 = []
arr1.each_with_index do |element, index|
  if fibonacci_numbers.include?(index)
    arr2 << element
  end
end

# p fibonacci_numbers
# p arr1
# p arr1[610]
p arr2
p arr2.size