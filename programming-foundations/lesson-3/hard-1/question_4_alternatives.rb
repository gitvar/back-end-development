# question_4_alternatives.rb

# Generate UUID:

def build_hex_array
  hex_arr = []
  (0..9).each { |char| hex_arr << char }
  ('a'..'f').each { |char| hex_arr << char }
  hex_arr
end

uuid2 = generate_UUID2
puts "UUID2 = #{uuid2}"

def new_UUID
  uuid_array = []
  hex_array = build_hex_array()
  sections = [8, 4, 4, 4, 12]

  sections.each do |num_samples|
    uuid_array << hex_array.sample(num_samples)
    uuid_array << '-' unless num_samples == 12
  end
  uuid_array.join('')
end

my_uuid_string = new_UUID()
puts my_uuid_string


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
