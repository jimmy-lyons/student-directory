#first add all the students to an array
students = [
"The students of Villains Academy",
"----------------",
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
# and then print them
students.each do |student|
  puts student
end
# finally we print the total number of students
puts "Overall, we have #{students.count} great students"