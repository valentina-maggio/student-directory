def input_students
  puts "Please for each student enter the name"
  students = []
  student = gets.chomp
  puts "And now enter the cohort"
  cohort = gets.chomp
  # Populate the student array with student name and cohort (if cohort not specified, will add 'NotSpecified')
  while !student.empty? do
  # When there is a typo the user can re-enter the inputs  
    puts "If you made a typo, please enter 'typo', else hit return and keep entering the student name and cohort."
    typo = gets.chomp
    if typo == 'typo'
      puts "Please re-enter the student name"
      student = gets.chomp
      puts "Please re-enter the cohort"
      cohort = gets.chomp
    end
    if cohort.empty?
      students << {name: student, cohort: :NotSpecified}
    else
      students << {name: student, cohort: cohort.to_sym}
    end
    puts "Now we have #{students.count} students"
    puts "To finish, juts hit return twice, else keep entering the students name and cohort."
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