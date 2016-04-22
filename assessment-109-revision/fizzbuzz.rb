# fizzbuzz.rb

def fizzbuzz(n1, n2, arr)
  (n1..n2).each do |num|
    case
    when num % 3 == 0 && num %5 == 0
      arr << "FizzBuzz, "
    when num % 3 == 0
      arr << "Fizz, "
    when num % 5 == 0
      arr << "Buzz,  "
    else
      arr << "#{num}, "
    end
  end
end

fizzbuzz_array = []
fizzbuzz(1, 30, fizzbuzz_array) 
p fizzbuzz_array