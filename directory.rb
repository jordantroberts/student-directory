# Set an instance variable that can be recognised across methods
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november} # Inside the block we know that the name is not empty (otherwise it woudn't be executed at all). Then we add a new hash to the array with the value of the name the user entered corresponding to the :name key. The value of the cohort is hardcoded.
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp) # Note that we are passing the user selection as an argument to the method.
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" #9 because we will be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  #open the file for writing
  file = File.open("students.csv","w") # write only - creates a new file for writing
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]] #on every iteration we create a new array with student's name and cohort - the info we want to save to the file. We do this in order to convert it to a comma-separated string on the next line.
    csv_line = student_data.join(",") #this method joins all the elements of the array it's called on together, using it's argument as a separator.
    file.puts csv_line #finally, we write the csv line to the file using the familar puts method, except we call it on a file, so it writes to the file and not on the screen.
  end
  file.close # every time you open a file, it needs to be closed
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
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



interactive_menu
