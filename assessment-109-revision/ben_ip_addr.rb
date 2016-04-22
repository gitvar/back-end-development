# Fix this code because:
# You're not returning a false condition,
# Not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
require "pry"

def is_a_number?(str)
  Integer(str)
  # binding.pry
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.count == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      # if !is_a_number?(word) || !(0..255).include?(word.to_i)
      # if !is_a_number?(word) || !(0..255).cover?(word.to_i)
      return false unless is_a_number?(word) && word.to_i.between?(0, 255)
    end
    return true
  end
  false
end

ip_addr = "192.200.0.255"
p "The ip address #{ip_addr} is valid: #{dot_separated_ip_address?(ip_addr)}"
