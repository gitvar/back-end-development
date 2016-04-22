# balancer.rb

def balancer(str)
  lb = "("
  rb = ")"
  bc = 0
  arr =str.split("")
  
  arr.each do |char|
    bc += 1 if char == lb
    bc -= 1 if char == rb
    return false if bc < 0
  end
  return false if bc != 0
  true
end

p balancer("hi")
p balancer("(hi)")
p balancer("(hi")
p balancer(")hi(")
p balancer("(()) )(")