require "date"

class Todo
  def initialize(text, due_date, completed)
    @text = text
    @due_date = due_date
    @completed = completed
  end

  # return the due date
  def due_date
    @due_date
  end

  # check the status if the todo is completed
  # check the due the date
  # return the full string of todo having completion status, todo and due date,
  # if the due date is today then do not print the due date

  def to_displayable_string
    display_status = (@completed == true) ? "[X]" : "[ ]"
    display_date = (@due_date == Date.today) ? nil : @due_date
    "#{display_status} #{@text} #{display_date}"
  end
end

class TodosList
  def initialize(todos)
    @todos = todos
  end

  # return the todo list according due date along with the status
  # if it's been completed or not

  def overdue
    TodosList.new(@todos.filter { |todo| todo.due_date < Date.today })
  end

  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_date == Date.today })
  end

  def due_later
    TodosList.new(@todos.filter { |todo| todo.due_date > Date.today })
  end

  # made a function to add items to the list
  def add(item)
    @todos.push(item)
  end

  # made a function to print the list if it's called
  def to_displayable_list
    @todos.map { |todo| todo.to_displayable_string }
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
