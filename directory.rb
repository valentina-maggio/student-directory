require 'csv'
@students = [] 

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit" 
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(user_selection)
  case user_selection 
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students ; puts "Student list successfully saved."
  when "4" then load_students(filename_to_load); puts "Student list successfully loaded."
  when "9" then puts "Goodbye!"; exit
  else puts "I don't know what you meant, try again."
  end
end

def add_student_name
  puts "Please enter the names of the students."
  puts "To finish, juts hit return twice."
  name = STDIN.gets.chomp
end

def add_cohort_name(name)
  puts "Please enter the cohort of #{name}."
  cohort = STDIN.gets.chomp
end

def input_students
  name = add_student_name
  while !name.empty? do
    cohort = add_cohort_name(name)
    update_student_list(name, cohort)
    puts "Student upload completed. Now we have #{@students.count} students."
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

def print_student_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students. Show students action completed."
end

def filename_to_save
  puts "Please enter the file name where you wish to save the student list."
  filename = STDIN.gets.chomp
end

def save_students
  CSV.open(filename_to_save, "w") do |line|
    @students.each { |student| line << [student[:name], student[:cohort]] }
  end
end

def filename_to_load
  puts "Please enter the file name from which you wish to load the student list."
  filename = STDIN.gets.chomp
  loop do
    if File.exists?(filename)
      return filename
    else 
      puts "Sorry, #{filename} doesn't exist. Please try again."
      filename = STDIN.gets.chomp
    end
  end
end

def load_students(filename_to_load = "students.csv")
  CSV.foreach(filename_to_load) { |row| update_student_list(row[0], row[1]) }
end

def try_load_students
  filename = ARGV.first
  if filename.nil? 
    load_students("students.csv")
    puts "No file passed to ARGV. #{@students.count} students added by default."
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else 
    puts "Sorry, #{filename} doesn't exist."; exit 
  end
end

try_load_students
interactive_menu