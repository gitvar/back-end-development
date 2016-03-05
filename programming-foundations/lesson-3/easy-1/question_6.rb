# question_6.rb

# Starting with the string:

# famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

# method 1:
famous_words = "seven years ago..."
famous_words = 'Four score and ' + famous_words
p famous_words

# method 2:
famous_words = "seven years ago..."
famous_words = 'Four score and ' << famous_words
p famous_words

# method 3 (by Launch School):
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
p famous_words
