# loops_iterators_4_recursion.rb

def count_down(n)
  puts n
  count_down(n-1) if n > 0
end

count_down(10)
