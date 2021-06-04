=begin
# Problem 1
names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
# fill in code that will return a new array of the full names:
#   ["Jhumpa Lahiri", "J.K Rowling", ...]

=begin

new_names = names.map { |x| x.join(" ") }
new_names.each { |x| puts x }

#=end

names.map { |x| puts x.join(" ") }

# Problem 2

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
# fill in code that will print:
#   Design As Art was written by Bruno Munari
#   Anathem was written by Neal Stephenson
#   ...

books.map.with_index { |item, i| puts "#{item} was written by #{authors[i]}" }
=end
#problem 3
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

# Fill in code that will print:
#   money:
#     Send invoice
#     Pay rent
#     Pay taxes
#   organize:
#     Clean room
#     Arrange books
#   food:
#     Buy groceries

categories = []

todos.each { |todo|
  if (categories.include? todo[1]) == false
    categories.append(todo[1])
  end
}

categories.each { |cat|
  puts "#{cat}:\n"
  todos.each { |todo|
    if (todo[1] == cat)
      puts "  #{todo[0]}"
    end
  }
}
