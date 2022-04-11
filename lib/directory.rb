def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array of students
  students = []
  # get first name
  name = gets.chomp
  # while name is not empty, reapeat this code
  while !name.empty? do
    # add student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user 
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------"
end

def print(students)
  i = 0
  until i == students.length do 
    puts "#{(i+1)}: #{students[i][:name]} (#{students[i][:cohort]})"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)