 # calculator.rb

 # Build a command line calculator program that does the following:
 #
 #     asks for two numbers
 #     asks for the type of operation to perform: add, subtract, multiply or divide
 #     displays the result
 #
 # Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().

 Kernel.puts("Hi, I am a calculator program! Please give me two numbers...")

 Kernel.puts("What is the first number?")
 number1 = Kernel.gets().chomp()

 Kernel.puts("What is the 2nd number?")
 number2 = Kernel.gets().chomp()

 Kernel.puts()
 Kernel.puts("What operation is required? : 1) +  2) -  3) *  4) / ")
 operator = Kernel.gets().chomp()

```ruby
 case
 when operator == '1'
   answer = number1.to_i() + number2.to_i()
 when operator == '2'
   answer = number1.to_i() - number2.to_i()
 when operator == '3'
   answer = number1.to_i() * number2.to_i()
 when operator == '4'
   answer = number1.to_f() / number2.to_f()
 else
   Kernel.puts("I cannot perform that operation, sorry!")
   exit
 end

Kernel.puts("The answer is #{answer}")
```
#Kernel.puts("Extra puts added for git test purposes!")

#Kernel.puts("Append this new line, also for test purposes - at the source (GitHub).)

# new comment.
# And another!
# Another at GitHub.
