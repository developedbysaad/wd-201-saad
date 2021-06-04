#books = ["Design as Art", "Anathem", "Shogun"]
#authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
# fill in code that will create a Hash that looks like:
#   {
#     :bruno => "Design as Art",
#     :neal => "Anathem",
#     ...
#   }
# reference -> https://stackoverflow.com/questions/2943422/in-ruby-how-do-i-make-a-hash-from-an-array

=begin

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
auth_arr = authors.map { |a| a.split }
auth_h = Hash[auth_arr.collect.with_index { |auth, i|
                [auth[0].to_sym, books[i]]
              }
]
puts auth_h

=end

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

# Fill in code that will create a Hash that looks like:
#   {
#     :money =>
#       ["Send invoice", "Pay rent", ...],
#     ...
#   }

categories = []
todos.map { |todo|
  if (categories.include? todo[1]) == false
    categories.push(todo[1])
  end
}
#categories.each_slice(1).to_a
#puts categories
item = Array.new(categories.length).each_slice(1).to_a
categories.map.with_index { |cat, i|
  todos.map { |todo|
    if todo[1] == cat
      item[i].push(todo[0])
    end
  }
}
h = Hash[categories.collect.with_index { |c, i|
           [c.to_sym, item[i].compact]              #compact deletes the nil values
         }]
puts h
