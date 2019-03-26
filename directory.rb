# Set an instance variable that can be recognised across methods
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november} # Inside the block we know that the name is not empty (otherwise it woudn't be executed at all). Then we add a new hash to the array with the value of the name the user entered corresponding to the :name key. The value of the cohort is hardcoded.
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp) # Note that we are passing the user selection as an argument to the method.
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from the students.csv"
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

def load_students(filename = "students.csv") # If we have data saved to file, we can load it at startup, so we don't need to input all the students again. The loading procedure is the reverse of the saving procedure above.
  file = File.open("students.csv", "r") # Open the file for reading
  file.readlines.each do |line| #Iterate over all of the lines, split every line at the comma and put a new hash into the array @students.
  name, cohort = line.chomp.split(',') #On every iteration we discard the training new line character from the line, split it at the comma (this will give us an array with two elements), and assign it to the name and cohort variables. We are also doing a parallel assignment here - that is, assigning two variables at the same time. If the assigned value is an array, then the first variable will get the first value of the array, the second variable will get the second value and so on.
    @students << {name: name, cohort: cohort.to_sym} # Once we have the name and cohort, we createa  new hash and put it into the list of students.
    # The only thing different from the input_students method that does the same operation is that here we are converting a string that we read from the file to a symbol - this is for consistency. If we decided to store the cohort as a symbol, we shouldn't change the format.
  end
  file.close # finally, we close the file.
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
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


try_load_students
interactive_menu
