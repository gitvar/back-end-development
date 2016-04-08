words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams = {}

words.each do |word|
  key = word.split('').sort.join
  if anagrams.has_key?(key)
    anagrams[key] << word
  else
    anagrams[key] = [word]
  end
end

anagrams.each_key do |key| 
  # p anagrams[key]
end
p anagrams

hash1 = {}

hash1 = {"name" => "Ben", "surname" => "Van"}

p hash1["name"]
p hash1.key("Ben")
p hash1["key1"] = "House_key"

p hash1
