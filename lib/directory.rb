@students = []
@data_loaded = false

def useful_gets
  return STDIN.gets.downcase.delete("\n")
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit enter twice"
  # get first name
  name = STDIN.gets.chomp
  # while 'exit' is not typed', reapeat this code
  while !name.empty? do
    puts "Student Cohort: "
    cohort = STDIN.gets.chomp.downcase
    cohort == ""? cohort = :november : cohort = cohort.to_sym
    
    puts "Student Age: "
    age = STDIN.gets.chomp.to_i
    
    puts "Place of Birth: "
    birth_place = STDIN.gets.chomp
    
    student_info_push(name, cohort, age, birth_place)
    
    if @students.length != 1
      puts "Now we have #{@students.count} students - add a name or hit enter to exit."
    else
      puts "Now we have 1 student - add a name or hit enter to exit."
    end
    
    # get another name from the user 
    name = STDIN.gets.chomp
  end
end

def student_info_push(name, cohort, age, birth_place)
  cohort = cohort.to_sym
  @students << {name: name, cohort: cohort, age: age, birth_place: birth_place}
end

def print_header
  puts "The students of Villains Academy"
  puts "----------------"
end

def print_students
  puts "Which cohort would you like to see?"
  month = STDIN.gets.downcase.delete("\n").to_sym
  @students.map do |student|
    if student[:cohort] == month
      puts "#{student[:name]} - (#{student[:cohort]})"
      puts "Age:".rjust(20) + " #{student[:age]}"
      puts "Place of Birth:".rjust(20) + " #{student[:birth_place]}"
    end
  end
end

def print_footer
  puts ""
  puts "Overall, we have #{@students.count} great students"
  puts "----------------"
end

def print_menu
  puts ""
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
  puts ""
end

def show_students
  if @students.length >= 1
    print_students
    print_footer
  else
    puts "No students in directory"
  end
end

def save_students_options
  puts "1. Save students to default students.csv"
  puts "2. Save students to new file"
  choice = STDIN.gets.downcase.delete("\n")
  case choice
  when "1"
    # should use save students with standard input
    save_students("students.csv")
  when "2"
    # should ask for new filename
    puts "Please type new filename"
    filename = useful_gets
    # save to new filename
    save_students(filename)
  end
end

def save_students(filename)
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age], student[:birth_place]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

def load_students_options
  puts "1. Load students from students.csv"
  puts "2. Load students from another file"
  choice = useful_gets
  case choice
  when "1"
    load_students
    puts "Loaded #{@students.count} from students.csv"
  when "2"
    puts "which file would you like to open?"
    filename = useful_gets
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  end
end

def load_students(filename = "students.csv")
  if @data_loaded == true
    puts "Students already loaded"
    return
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, age, birth_place = line.chomp.split(",")
    student_info_push(name, cohort, age, birth_place)
  end
  file.close
  @data_loaded = true
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students_options
  when "4"
    load_students_options
  when "9"
    exit
  else
    puts "I don't know what you meant, ask again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu