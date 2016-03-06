# question_1.rb

# In this hash of people and their age, see if there is an age present for 'Spot'.
# I.e. find a VALUE for a given KEY.
# Bonus: What are two other hash methods that would work just as well for this solution?

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

# Answer 1:
p ages.include?('Spot')

# Answer 2:
p ages.key?('Spot')

# Answer 3:
p ages.member?('Spot')

# Answer 4:
p ages.any? { |key, _value| key == 'Spot' }

# Answer 5:
p ages.select { |key, _value| key == 'Spot' }
p ages.select { |key, _value| key == 'Eddie' }

# Answer 6:
p ages.none? { |key, _| key == 'Spot' }
p ages.none? { |key, _| key == 'Eddie' }

# Answer 7:
p ages.count { |key, _| key == 'Spot' }

# Answer 8:
p [nil] == ages.values_at('Spot')
p [10] == ages.values_at('Eddie') # Test

# Additional -> find a key for a given value:
# See if there is a name (key) present for the (value) 91:
#
p ages.value?(91)
# p ages.value?(402) # Test

p ages.has_value?(91) # has_value has been depricated: use key?
# Rubocop resu;t: question_1.rb:42:8: C: Hash#has_value? is deprecated in favor of Hash#value?.

p ages.rassoc(91)

p ages.select { |_key, value| value == 91 }
# p ages.select { |key, value| value == 402 }

p ages.none? { |_, value| value == 91 }
# p ages.none? { |key, value| value == 402 } # Test

p ages.count { |_, value| value == 91 }
# p ages.count { |key, value| value == 402 } # Test
