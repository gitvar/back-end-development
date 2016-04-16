statement = "The Flintstones Rock!!!"
letters = ("a".."z").to_a + ("A".."Z").to_a
h = {}

statement.split('').select do |letter|

  if letters.include?(letter)
      h[letter] = statement.scan(letter).count
  end
end
p h
