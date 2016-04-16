my_file = File.new("file1.txt", "w+")
my_file.close

File.open("file1.txt", "w") do |file|
    file.puts "First line of text"
end

File.open("file1.txt", "a+") do |file|
    file.puts "Second line of text"
end

File.readlines("file1.txt").each do |line|
  puts line
end
