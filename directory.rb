def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do #we are writing a block of code that will be executed repeatedly as long as the name variable is not empty.
    #The empty? method is part of the string class. If the name entered on line 7 is not empty (! means negation) the block will be executed at least once.
    #If not, it will be skipped alogether and Ruby will jump to line 17.
    #add the student hash to the array
    students << {name: name, cohort: :november}#Inside the block we know that the name is not empty (otherwise it woudn't be executed at all). Then we add a new hash to the array with the value of the name the user entered corresponding to the :name key. The value of the cohort is hardcoded.
    puts "Now we have #{students.count} students"#Then we print a line to let the user know how many students have been entered so far and ask for another name. When the current iteration finishes, the next thing that will be evaluated is the condition on line 9. If the user entered an empty name, Ruby will jump to line 17.
    #get another name from user
    name = gets.chomp
  end
  #return array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------".center(50)
end
def print(students)
  students.each_with_index do |student, index|
    indexstartat1 = index + 1
      #if student[:name].chr == "J" &&
      if student[:name].length < 12
        puts "#{indexstartat1}. #{student[:name]} #{student[:cohort]} cohort"
      end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end
def interactive_menu
  students = [] #We declared the variable 'students' before the loop and set it to an empty array.
  #We did this so that it was available in several iterations of the loop. If we didn't, it would be set in the
  #first iteration (if we entered some students) but wouldn't exist on the second iteration. To make it persist across
  #different iterations, we need to declare it outside the loop.
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" #9 because we will be adding more items
    #2. read the input and save it to a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you mean, try again"
    end
  end
end
#nothing happens until we can call the methods
interactive_menu
students = input_students
print_header
print(students)
print_footer(students)
