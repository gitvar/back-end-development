 # question_5.rb
#
# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions.
# Alyssa supplied Ben with a method called is_a_number? to determine if a string is a number and asked Ben to use it.
# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
#
# Help Ben fix his code.

# My Answer:
def is_a_number?(num)
    num.to_f.to_s == num.to_s || num.to_i.to_s == num.to_s
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  if dot_separated_words.count == 4
    dot_separated_words.each do |element|
      if !is_a_number?(element.to_i) || !(0..255).include?(element.to_i)
        return false
      end
    end
    return true
  end
  false
end

p dot_separated_ip_address?('192.168.0.191')

# Launch School Answer:
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end

# Note: Ben's original return true on the last line of the method can be shortened to just true. This is because Ruby returns the result of the last line of any method by default.
