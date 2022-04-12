def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit enter twice"
  # get first name
  name = gets.chomp
  # while 'exit' is not typed', reapeat this code
  while !name.empty? do
    puts "Student Cohort: "
    cohort = gets.chomp.downcase
    cohort == ""? cohort = :november : cohort = cohort.to_sym
    
    puts "Student Age: "
    age = gets.chomp.to_i
    
    puts "Place of Birth: "
    birth_place = gets.chomp
    
    puts "List hobbies with comma separation:"
    hobbies = gets.chomp.split(",")
    @students << {name: name, cohort: cohort, age: age, birth_place: birth_place, hobbies: hobbies}
    
    if @students.length != 1
      puts "Now we have #{@students.count} students - add a name or hit enter to exit."
    else
      puts "Now we have 1 student - add a name or hit enter to exit."
    end
    
    # get another name from the user 
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------"
end

def print_students
  puts "Which cohort would you like to see?"
  month = gets.downcase.delete("\n").to_sym
  print_header
  @students.map do |student|
    if student[:cohort] == month
      puts "#{student[:name]} - (#{student[:cohort]})"
      puts "Age:".rjust(20) + " #{student[:age]}"
      puts "Place of Birth:".rjust(20) + " #{student[:birth_place]}"
      puts "Hobbies:".rjust(20) + " #{student[:hobbies].join(",")}"
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  if @students.length >= 1
    print_students
    print_footer
  else
    puts "No students in directory"
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, ask again"
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu