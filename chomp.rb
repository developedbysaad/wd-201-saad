=begin
          This is an example without chomp
puts "what is your name"
name = gets.upcase
puts "What is you age"
age = gets

puts "Your name is " + name + " and you are " + age + "years old"

=end

#This is an example with chomp
puts "what is your name"
name = gets.upcase.chomp
puts "What is you age"
age = gets.chomp

puts "Your name is " + name + " and you are " + age + " years old"
