# question_4.rb
#
# Starting with this string:
#
# munsters_description = "The Munsters are creepy in a good way."
#
# Convert the string in the following ways (code will be executed on original munsters_description above):
#
# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description = "The Munsters are creepy in a good way."

munsters_description.capitalize
# For the next operation to work correctly this must not be
# munsters_description.capitalize!
p munsters_description

munsters_description.swapcase!
p munsters_description
# Note: For this operation to give the requested result, the M in Munsters must
# not be lowercase before the .swapcase! method is called.

munsters_description.downcase!
p munsters_description

munsters_description.upcase!
p munsters_description
