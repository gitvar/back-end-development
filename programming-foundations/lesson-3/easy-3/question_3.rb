# question_3.rb

# In the previous exercise we added Dino to our array like this:
#
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << "Dino"
#
# We could have used either Array#concat or Array#push to add Dino to the family.
#
# How can we add multiple items to our array? (Dino and Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
dinosaurs = %w(Dino Hoppy)
flintstones.concat(dinosaurs)
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
dinosaurs = %w(Dino Hoppy)
flintstones.push(dinosaurs).flatten!
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
dinosaurs = %w(Dino Hoppy)
(flintstones << dinosaurs).flatten!
p flintstones

# Launch Shool answer:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
dinosaurs = %w(Dino Hoppy)
flintstones.push(dinosaurs[0]).push(dinosaurs[1])
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino').push('Hoppy')
p flintstones
