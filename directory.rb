@students = [] 

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" 
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(user_selection)
  case user_selection # Refactoring of the case statement
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then load_students
  when "9" then exit
  else puts "I don't know what you meant, try again"
  end
end

def add_student_name
  puts "Please enter the names of the students"
  puts "To finish, juts hit return twice"
  name = STDIN.gets.chomp
end

def add_cohort_name(name)
  puts "Please enter the cohort of #{name}"
  cohort = STDIN.gets.chomp
end

def input_students
  name = add_student_name
  while !name.empty? do
    cohort = add_cohort_name(name)
    update_student_list(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def update_student_list(name, cohort) 
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list # Refactoring of the block
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    update_student_list(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil? 
    load_students("students.csv")
    puts "No file passed to ARGV. #{@students.count} students added by default"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist"
    exit 
  end
end

try_load_students
interactive_menu