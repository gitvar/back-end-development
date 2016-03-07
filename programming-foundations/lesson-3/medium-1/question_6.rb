# question_6.rb
#
# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.
#
# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # The << method will modify my_buffer!
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

my_buffer = []
max_buffer_size = 5
10.times do |element|
  rolling_buffer1(my_buffer, max_buffer_size, element) # my_buffer will be changed after this call.
  p my_buffer
end

# =========================================================================

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] # The '+' will not modify my_buffer.
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

my_buffer = []
max_buffer_size = 5
10.times do |element|
  my_buffer = rolling_buffer2(my_buffer, max_buffer_size, element) # have to do 'my_buffer = '
  p my_buffer
end

# Launch School Answer:
# Yes, there is a difference. While both methods have the same return value, in the first implementation, the input argument called buffer will be modified and will end up being changed after rolling_buffer1 returns. That is, the caller will have the input array that they pass in be different once the call returns. In the other implementation, rolling_buffer2 will not alter the caller's input argument.
