# basics_4.rb

# hash to array:
movies = { "Rambo" => "1984", "Crazy_Horse" => "1990", "Johnny" => "2010" }

date_array = []
date_array = movies.map { |_name, year| year }
p date_array

date_array = []
movies.each { |name, _year| date_array << movies[name] }
p date_array

date_array = []
movies.each { |_, year| date_array << year }
p date_array

# array to hash:
animal_array = %w(cat, dog, horse, frog)
animal_hash = Hash.new
animal_array.each_with_index { |animal, index| animal_hash[index] = animal }
p animal_hash
