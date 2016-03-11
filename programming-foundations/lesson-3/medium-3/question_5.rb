 # question_5.rb
#
# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid_2?(color)
  case color
  when "blue"
    true
  when "green"
    true
  else
    false
  end
end

# Launch School Answer!
def color_valid_3?(color)
  color == "blue" || color == "green"
end

color = "green"
puts color_valid(color)
puts color_valid_2?(color)
puts color_valid_3?(color)
