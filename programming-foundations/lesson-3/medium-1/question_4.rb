# question_4.rb
#
# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  p numbers.shift(1)
end
# 1 2 3 4 (vertically) as each number is printed before it is removed by shift. WRONG!
# Launch School answer is: 1 3 (vertically).


puts
puts

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# => 1 2 (vertically). 3 and 4 will be popped just fater 2 is printed to the screen.
# Launch School answer and mine is the same.

# launch School Answer - Part 1:
# To better understand what is happening here, we augment our loop with some additional "debugging" information:

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# The output is:
#
# "0  [1, 2, 3, 4]  1"
# "1  [2, 3, 4]  3"
#
# From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by #each is compared against the current length of the array rather than its original length.
#
# In our first example, the removal of the first item in the first pass changes the value found for the second pass.
#
# In our second example, we are shortening the array each pass just as in the first example...but the items removed are beyond the point we are sampling from in the abbreviated loop.
#
# In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time.
