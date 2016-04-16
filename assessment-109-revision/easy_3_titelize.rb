sentence = "This is going to be a heading!"
sentence = sentence.split(' ').map! { |word| word.capitalize }.join(' ')
puts sentence
