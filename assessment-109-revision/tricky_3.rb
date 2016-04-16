def tricky_method_two(a_string_param, an_array_param)
  puts a_string_param.object_id
  # a_string_param += 'rutabaga'
  # a_string_param << 'rutabaga'
  a_string_param.gsub!('pumpkins', 'rutabaga')
  puts a_string_param.object_id

  puts an_array_param.object_id
  # an_array_param = ['pumpkins', 'rutabaga']
  # an_array_param << ['rutabaga']
  an_array_param[0] = 'rutabaga'
  puts an_array_param.object_id
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
