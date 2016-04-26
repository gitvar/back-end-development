# Write a method that returns the number of Friday the 13ths in the year passed in as an argument. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom), and you may assume that the same calendar will remain in use for the foreseeable future.

# friday_13th?(2015) # -> 3
# friday_13th?(1986) # -> 1

require 'date'

def friday_13th?(year)
  counter = 0
  day = 13
  month = 1
  d = Date.new(year, month, day)
  while d.month != 12 do
    counter += 1 if d.friday? && d.day == 13
    d = d.next_month
  end
  counter
end

(1980..2030).each do |year|
  puts "Year: #{year} - Friday the 13th's: #{friday_13th?(year)}"
end
