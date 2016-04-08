# basics_5.rb

# Factorial of 5 to 8

def factorial(no)
  return no if no == 1
  no = no * factorial(no - 1)
end

# Factorial => 5! = 5 * 4 * 3 * 2 * 1 = 120
(5..8).each { |number| puts factorial(number) }
