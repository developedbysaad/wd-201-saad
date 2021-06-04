#ask for a list of todos
# and print them back to us

#what i learned in this program
# '#' writes a comment
# puts and gets
# \n\n puts two line space, number of spaces can be increased by increasing the number of \n
# string Interpolation format = "anystring #{variable}"
# variables
# puts "[ ] #{5 + 2}" # can also perform arithmatic operation using string Interpolation

puts "what is your next todo?"
next_todo = gets
puts "So, this is your next todo."
#puts next_todo
puts "\n\n\n" #carriage Return
puts "[ ] #{next_todo}"
