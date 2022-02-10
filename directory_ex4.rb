def input_students
  puts "Please enter the names of the students"
  puts "To finish, juts hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  idx = 0
  until idx == students.length do
    puts "#{students[idx][:name]} (#{students[idx][:cohort]} cohort)"
    idx += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# Nothing happens until we call the methods
print_header
print(students)
print_footer(students)