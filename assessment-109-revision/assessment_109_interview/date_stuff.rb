# date_stuff.rb

require 'date'

date = Date.new(2016, 04, 22)

print date.month.to_s + " "
p date.day
date = date.next_month
print date.month.to_s + " "
p date.day
