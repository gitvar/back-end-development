# Remove vowels from string:

def remove_vowels(str)
  arr = str.split('')
  arr.delete_if { |letter| ["a", "e","i", "o", "u"].include?(letter) }
  str = arr.join
end

string = "Hello everybody! How are you?"
p remove_vowels(string)