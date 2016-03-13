# question_4.rb
# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.
#
# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.
#
# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
#
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#
# Write a method that returns one UUID when called with no parameters.

def generate_random_hex_string(length)
  rnd_hex_string = ""
  length.times do
    rnd_hex_number = rand(16)
    rnd_hex_string << rnd_hex_number.to_s(16)
  end
  rnd_hex_string
end

def generate_UUID
  uu_id = generate_random_hex_string(32)
  uu_id.insert(8, '-')
  uu_id.insert(13, '-')
  uu_id.insert(18, '-')
  uu_id.insert(23, '-')
end

uuid = generate_UUID
puts "UUID  = #{uuid}"

# ----- END -----

# Launch School Answer:
def generate_UUID2
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid << characters.sample }
    uuid << '-' unless index >= sections.size - 1
  end

  uuid
end

uuid2 = generate_UUID2
puts "UUID2 = #{uuid2}"

# Output:
# UUID  = c42e1790-5e83-0474-4d15-af18e568d341
# UUID2 = c855fd4b-af7e-efca-e81a-2373f6a244b3
