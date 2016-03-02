# mortgage_calculator.rb

# Take everything you've learned so far and build a mortgage calculator (or car
# payment calculator -- it's the same thing).
#
# You'll need three pieces of information:
#
#     the loan amount
#     the Annual Percentage Rate (APR)
#     the loan duration
#
# From the above, you'll need to calculate the following two things:
#
#     monthly interest rate
#     loan duration in months
#
# You can then use the formula described here:
# http://www.mtgprofessor.com/formulas.htm
#
# Finally, don't forget to run your code through Rubocop.
#
# Hints:
#     1. Figure out what format your inputs need to be in. For example, should
#      the interest rate be expressed as 5 or .05, if you mean 5% interest?
#     2. If you're working with Annual Percentage Rate (APR), you'll need to
#     convert that to a monthly interest rate.
#     3. Be careful about the loan duration -- are you working with months or
#     years? Choose variable names carefully to assist in remembering.
#
#  Formula:
#             Fixed Monthly Payment:
#             P = L[c(1 + c)n]/[(1 + c)n - 1]
#               L = Loan Amount
#               c = monthly interest = Annual Percentage Rate / 12
#               n = Loan duration in months
#
require 'YAML'
require 'pry'

LANGUAGE = 'en'.freeze

case LANGUAGE
when 'en'
  MESSAGES = YAML.load_file('mortgage_calculator_messages_english.yml')
# when 'af'
  # MESSAGES = YAML.load_file('mortgage_calculator_messages_afrikaans.yml')
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

def prompt_1(key)
  puts "=> #{MESSAGES[key]}"
end

def prompt_2(message = " ")
  puts "=> #{message}"
end

def clean_line
  puts " "
end

name = ''
loan_amount = 0.0
annual_percentage_rate = 0.0
monthly_interest_rate = 0.0
loan_duration_years = 0
loan_duration_months = 0.0
fixed_monthly_payment = 0.0

clean_line

prompt_1('welcome')
loop do
  name = gets.chomp
  break unless name.empty?
  prompt_1('invalid_name')
end

clean_line
prompt_2(MESSAGES['hello_name'] % {:name=>name} )
clean_line
prompt_1('intro1')
clean_line

loop do
  prompt_1('heading1')
  prompt_1('underline_heading1')

  clean_line

  loop do
    prompt_1('loan_amount')
    loan_amount = gets.chomp.to_f
    break if (valid?(loan_amount) && loan_amount > 0)
    prompt_1('invalid_entry')
  end

  clean_line

  loop do
    prompt_1('annual_percentage_rate')
    annual_percentage_rate = gets.chomp.to_f
    break if (valid?(annual_percentage_rate) && annual_percentage_rate > 0)
    prompt_1('invalid_entry')
  end

  clean_line

  loop do
    prompt_1('loan_duration_years')
    loan_duration_years = gets.chomp.to_i
    break if (valid?(loan_duration_years) && loan_duration_years > 0)
    prompt_1('invalid_entry')
  end

  clean_line

  #Formula:
  #             Fixed Monthly Payment:
  #             P = L[c(1 + c)n]/[(1 + c)n - 1]
  #               L = Loan Amount
  #               c = monthly interest = Annual Percentage Rate / 12
  #               n = Loan duration in months

  prompt_1('calculating')

  monthly_interest_rate = annual_percentage_rate/12/100
  loan_duration_months = loan_duration_years*12

  fixed_monthly_payment = (loan_amount * monthly_interest_rate * (1 + monthly_interest_rate)**loan_duration_months) / (((1 + monthly_interest_rate)**loan_duration_months)-1)

  fixed_monthly_payment = fixed_monthly_payment.round(2)

  clean_line

  prompt_2(MESSAGES['monthly_payment'] % {:fixed_monthly_payment => fixed_monthly_payment})

  clean_line

  prompt_1('continue')
  input = gets.chomp
  break unless input.downcase().start_with?(MESSAGES['continue_answer_starts_with_y'])

  clean_line

end

prompt_1('goodbye_message')
