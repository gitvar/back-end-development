sample_uuid = "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
LENGTH = sample_uuid.length - 4 # 4 dashes
HEX = (0..9).to_a + ("a".."f").to_a

def create_uuid
  uuid = []
  dashes = [8, 13, 18, 23]
  LENGTH.times { uuid << HEX.sample }
  dashes.each { |index| uuid.insert(index, "-") }
  uuid.join
end

uuid = ""
p sample_uuid
p uuid = create_uuid
