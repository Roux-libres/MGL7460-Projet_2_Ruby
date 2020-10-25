require_relative 'simple_number'

puts "Please enter your name"
name = gets.chomp
puts "Hello, #{name}! I'm Ruby!"
age = 21
age2= SimpleNumber.new(age).multiply(2)
puts "The double of your age is #{age2}"