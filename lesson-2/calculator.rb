# calculator.rb

# Build a command line calculator program that does the following:
#
#     asks for two numbers
#     asks for the type of operation to perform: add, subtract, multiply or divide
#     displays the result
#
# Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display
# output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove
# it: Kernel.gets().chomp().

require 'pry'

def prompt(message = " ")
  Kernel.puts("=> #{message}")
end

def valid?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

name = ''
number1 = ''
number2 = ''
operator = ''

prompt("Hi, I am a calculator program! Please enter your name.")
loop do
  name = Kernel.gets().chomp()
  break unless name.empty?
  prompt("Hmmm... Please anter a valid name.")
end

prompt("Hello #{name}, please give me two numbers to work with:")

loop do
  loop do
    prompt("What is the first number?")
    number1 = Kernel.gets().chomp()
    break if valid?(number1)
    prompt("Hmmm... That doesn't look right. Try again ...")
  end

  loop do
    prompt("What is the second number?")
    number2 = Kernel.gets().chomp()
    break if valid?(number2)
    prompt("Hmmm... That doesn't look right. Try again ...")
  end

  prompt("What operation is required? : 1) +  2) -  3) *  4) / ")
  operator_prompt = <<~MSG
  What operation is required?
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
   MSG

  prompt(operator_prompt)
  loop do
    operator = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operator)
    prompt("Choose only 1, 2, 3 or 4 please #{name}.")
  end

  prompt("#{operation_to_message(operator)} the numbers #{number1} and #{number2}")

  answer =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  # binding.pry

  prompt("The answer is #{answer}")
  prompt("Again? (Y) to continue")
  input = Kernel.gets().chomp()
  break unless input.downcase().start_with?("y")
end

prompt("Thanks for using 'calulator.rb', #{name}. Goodbye!")
