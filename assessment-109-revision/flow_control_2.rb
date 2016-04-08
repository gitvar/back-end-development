# flow_control_2.rb

def capitalize_long_strings(string)
  if string.length > 10
    string.upcase!
  else
    string
  end
end

str = "Hello world"
puts capitalize_long_strings(str)
puts capitalize_long_strings("Hello")
