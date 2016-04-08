arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr2 = arr1.map { |e| e + 2 }
p arr1
p arr2
arr1.each_index { |i| print "#{arr1[i]}, "}
puts
arr2.each_with_index { |e, i| print "arr1[#{i}] = #{e}, " }
puts