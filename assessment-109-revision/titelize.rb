# titelize.rb

def titelize(str)
  str.split(' ').map { |word| word.capitalize }.join(' ')
end

p titelize("This is going to be a heading!")
