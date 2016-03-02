# calculator.rb

LANGUAGE = 'af'

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
require 'yaml'

case LANGUAGE
when 'en'
  MESSAGES = YAML.load_file('calculator_messages_english.yml')
when 'af'
  MESSAGES = YAML.load_file('calculator_messages_afrikaans.yml')
end

def prompt(message = " ")
  Kernel.puts("=> #{message}")
end

def float?(num)
  Float(num) rescue false
end

def integer?(num)
  Integer(num) rescue false
end

def valid?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  result =  case op
            when '1'
              MESSAGES['add']
            when '2'
              MESSAGES['sub']
            when '3'
              MESSAGES['mul']
            when '4'
              MESSAGES['div']
            end
  # More code here if required.
  result
end

name = ''
number1 = ''
number2 = ''
operator = ''

prompt(MESSAGES['welcome'])
loop do
  name = Kernel.gets().chomp()
  break unless name.empty?
  prompt(MESSAGES['valid_name'])
end

prompt(MESSAGES['hello'] % {:name=>name})
prompt(MESSAGES['request_numbers'])

loop do
  loop do
    prompt(MESSAGES['first_num'])
    number1 = Kernel.gets().chomp()
    break if valid?(number1)
    prompt(MESSAGES['invalid_entry'])
  end

  loop do
    prompt(MESSAGES['second_num'])
    number2 = Kernel.gets().chomp()
    break if valid?(number2)
    prompt(MESSAGES['invalid_entry'])
  end

  operator_prompt = MESSAGES['operation_request']

  # <<-MSG
  # What operation is required?
  #   1) Addition
  #   2) Subtraction
  #   3) Multiplication
  #   4) Division
  #  MSG

  prompt(operator_prompt)
  loop do
    operator = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operator)
    prompt(MESSAGES['operation_choices'])
  end

  #prompt("#{operation_to_message(operator)} the numbers #{number1} and #{number2}")
  op_to_message = "#{operation_to_message(operator)}"
  prompt(MESSAGES['operation_announcement'] % { :op => op_to_message, :number1 => number1, :number2 => number2 })
  answer =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              if number2.to_f == 0
                prompt(MESSAGES['divide_by_zero'])
              else
                number1.to_f() / number2.to_f()
              end
            end

  # binding.pry

  prompt(MESSAGES['answer'] % {:answer => answer})
  prompt(MESSAGES['continue'])
  input = Kernel.gets().chomp()
  break unless input.downcase().start_with?(MESSAGES['continue_answer_starts_with_y'])
end

prompt(MESSAGES['goodbye_message'])
