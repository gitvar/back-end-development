# question_4.rb

# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

# numbers = [1, 2, 3, 4, 5]

# What does the follow method calls do (assume we reset numbers to the original array between method calls)?
# numbers.delete_at(1)
# numbers.delete(1)

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
p numbers

# Will delete the element at index 1 which is '2'.
# returns the removed item (2).
# result [1, 3, 4, 5]


new_numbers = [1, 2, 3, 4, 5]
new_numbers.delete(1)
p new_numbers

# Will delete the element '1'.
# returns the removed item (1)
# result [2, 3, 4, 5]

Another thing to notice is that while both of these methods operate on the contents of the referenced array and modify it in place (rather than just returning a modified version of the array) these methods do NOT have the usual ! at the end of the method name for "modify in place" method names.
