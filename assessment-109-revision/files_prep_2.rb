
# dir = Dir.new("/Volumes/Ext 2TB")
#
# while file = dir. do
#   puts file
# end

# my_file = File.new("file1.txt", "w+")
# my_file.close
#
# File.open("file1.txt", "w") do |file|
#     file.puts "First line of text"
# end
#
# File.open("file1.txt", "a+") do |file|
#     file.puts "Second line of text"
# end
while true do
  system 'clear'
  File.readlines("/Volumes/Ext 2TB/file1.txt").each do |line|
    puts line
  end
  sleep(3)
end
