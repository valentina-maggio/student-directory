# Let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Normal Bates"
]
# And then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# Finally, we print the total number of students
print "Overall, we have #{student.count} great students"