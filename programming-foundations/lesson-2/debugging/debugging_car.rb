# debugging_car.rb

require 'pry'

class Car
  attr_accessor :brand, :model

  def initialize(new_car)
    self.brand = new_car.split(' ').first
    # binding.pry
    @model = new_car.split(' ').last
    # binding.pry
  end
  binding.pry
end

betty = Car.new('Ford Mustang')
binding.pry
puts betty.model.start_with?('M')
#   puts "Yes"
# else
#   puts "No"
# end
# debugging_car.rb:14:in `<main>': undefined method `start_with?' for nil:NilClass (NoMethodError)
