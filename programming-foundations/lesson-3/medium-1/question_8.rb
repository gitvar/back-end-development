# question_8.rb
#
# In another example we used some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize! This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
#
# Write your own version of the rails titleize implementation.

my_string = 'This is a sentence of one line only!'
my_other_string = 'Who said this was going to be easy?'

class String
  def titleize!
    buffer = self.split
    buffer.map!{ |word| word.capitalize }
    self.clear
    self << buffer.join(' ')
  end

  def titleize
    buffer = self.split
    buffer.map!{ |word| word.capitalize }
    buffer.join(' ')
  end

  def cap_words!
    buffer = self.split.map{ |word| word.capitalize }.join(' ')
    self.clear
    self << buffer
  end

  def cap_words
    self.split.map{ |word| word.capitalize }.join(' ')
  end

end

p my_string
p my_string.titleize
p my_string
my_string.titleize!
p my_string
puts
p my_other_string
p my_other_string.cap_words
p my_other_string
my_other_string.cap_words!
p my_other_string
