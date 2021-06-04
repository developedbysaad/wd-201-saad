def salute(name, greet)
  lname = name.split
  "#{greet.capitalize} Mr. #{lname.last.capitalize}"
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")
