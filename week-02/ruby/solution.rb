puts "Enter a number of years"
years = gets.chomp.to_i # this returns a string
hours = years * 365 * 24
puts "That's #{hours} hours."

puts "Enter a number of decades"
decades = gets.chomp.to_i
minutes = decades * 10 * 365 * 24 * 60
puts "That's #{minutes} minutes."

puts "Enter your age"
age = gets.chomp.to_i
seconds = age * 365 * 24 * 60 * 60
puts "That's #{seconds} seconds."