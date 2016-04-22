# calculator.rb

OPERATIONS = %w(nil adding subtracting multipying dividing)

def valid_number?(num)
  !!Float(num) rescue false
end

def prompt(str = '')
  if str.empty?
    puts
  else
    puts "=> #{str}"
  end
end

system 'clear'

name = ''
prompt 'Hi, welcome to the calculator program. What is your name?'
loop do
  name = gets.chomp
  break if !name.empty?
  prompt 'Please try entering your name again.'
end

loop do
  number1 = 0
  number2 = 0
  operation = 0
  answer = 0

  loop do
    prompt "#{name}, please enter the first of 2 numbers:"
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt "Please try again. That was not a valid number."
    end
  end
  
  loop do
    prompt "#{name}, please enter the second of the 2 numbers:"
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt "Please try again. That was not a valid number."
    end
  end
  
  prompt
  
  loop do
    prompt "Which operation is to be performed: \n1. Addition\n2. Subtraction\n3. Multiplication\n4. Division"
    operation = gets.chomp.to_i
    if [1, 2, 3, 4].include?(operation)
      break
    else
      prompt "Not a valid choice! Try again."
    end
  end
  
  answer =  case operation
            when 1 then number1.to_f + number2.to_f
            when 2 then number1.to_f - number2.to_f
            when 3 then number1.to_f * number2.to_f
            else        number1.to_f / number2.to_f
            end
  
  answer = format('%.2f', answer)            
  prompt
  prompt "#{name}, the result of #{OPERATIONS[operation]} #{number1} with #{number2} is #{answer}"
  prompt
  
  prompt "Do you want to do another calculation? (Yes or No)"
  another_operation = gets.chomp
  break if another_operation.downcase.start_with?("n")
end

prompt 'Thanks for using calculator! Good-bye...'