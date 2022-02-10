def input_students
  puts "Please for each student enter: name, hobby, country of birth and height in cm, separated by one space on the same line.".center(150)
  puts "To finish, juts hit return twice.".center(130)
  # Create an empty array
  students = []
  # Get the student name with details
  student = gets.chomp
  # While the name is not empty, repeat this code
  while !student.empty? do
    # Add the student hash to the array
    students << {
      name: student.split(" ")[0], 
      hobby: student.split(" ")[1], 
      country_of_birth: student.split(" ")[2], 
      height: student.split(" ")[3], 
      cohort: :november
    }
    puts "Now we have #{students.count} students".center(130)
    student = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(130)
  puts "-------------".center(130)
end

def print(students)
  idx = 0
  until idx == students.length do
    puts "#{students[idx][:name]}, #{students[idx][:hobby]}, #{students[idx][:country_of_birth]}, #{students[idx][:height]} (#{students[idx][:cohort]} cohort)".center(130)
    idx += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(130)
end

students = input_students
# Nothing happens until we call the methods
print_header
print(students)
print_footer(students)