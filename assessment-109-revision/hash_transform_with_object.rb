hash = { a: 2, b: 3 }
new_hash = {}
hash = hash.each_with_object(new_hash) do |(k, v), a|
 a[k] = v + 3
end
puts new_hash
