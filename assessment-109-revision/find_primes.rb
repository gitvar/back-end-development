# find_primes.rb

def is_prime?(num)
  (2...num).each { |n| return false if num % n == 0 }
  true
end

def find_primes(n1, n2)
  arr = []
  (n1..n2).each do |n| 
    arr << n if is_prime?(n)
  end
  arr
end

p find_primes(1, 200)