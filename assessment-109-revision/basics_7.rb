# basics_7.rb

system 'df -h'
# This does not work: %x(df -h)

a = %i[ one two three ]
p a
# => [:one, :two, :three]
