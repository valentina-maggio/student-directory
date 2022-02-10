def input_students
  puts "Please for each student enter the name"
  students = []
  student = gets.chomp

  puts "And now enter the cohort"
  cohort = gets.chomp
  # Populate the student array with student name and cohort (if cohort not specified, will add 'NotSpecified')
  puts "To finish, juts hit return twice."
  while !student.empty? do
    if cohort.empty?
      students << {name: student, cohort: :NotSpecified}
    else
      students << {name: student, cohort: cohort.to_sym}
    end
    puts "Now we have #{students.count} students"
    student = gets.chomp
    cohort = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  idx = 0
  until idx == students.length do
    puts "#{students[idx][:name]} (cohort: #{students[idx][:cohort]})"
    idx += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)