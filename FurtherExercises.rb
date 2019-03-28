#Refactor using CSV Library
require 'csv'

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
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
    puts "You selected option 1"
    input_students_details
  when "2"
    puts "You selected option 2"
    show_students_list
  when "3"
    puts "Student data saved"
    save_students
  when "4"
    puts "Student data loaded"
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

#def save_students
#  puts "Please enter the file you would like to save the data to"
#  filename = gets.chomp
#  file = File.open(filename,"w") do |file|
#    @students.each do |student|
#      student_data = [student[:name], student[:cohort]]
#      csv_line = student_data.join(",")
#      file.puts csv_line
#    end
#  end
#end

def save_students
  puts "Please enter the file you would like to save the data to"
  filename = gets.chomp
  CSV.open(filename,"wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]#.join(",") #Don't need join, csv will do it for me!
    end
  end
end

def load_students
  puts "Please enter a file you would like to load"
  filename = gets.chomp
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students_to_list(name)
    end
  end
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
