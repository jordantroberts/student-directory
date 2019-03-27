#How could you make the program load students.csv by default if no file is given on startup? Which methods would you need to change?

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from the students.csv"
  puts "9. Exit"
end

def display_interactive_menu
  loop do
    print_menu
    user_choice(STDIN.gets.chomp) #passing the user selection as an argument to the method
  end
end

def user_choice(selection) # starts with a case statement definition and takes the variable you're going to work with.
  case selection
  when "1"
    input_students_details
  when "2"
    show_students_list
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def add_students_to_list(name)
  @students << {name: name, cohort: :november}
end

def input_students_details
  puts "Please enter the names of the students. To finish, just hit return twice."
  name = STDIN.gets.chomp
  until name.empty? do
    add_students_to_list(name)
    puts "We currently have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students_list
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------".center(50)
end

def print_students_list
  @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students_to_list(name)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
    puts "Loaded default student file"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end


try_load_students
display_interactive_menu
