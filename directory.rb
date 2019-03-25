def input_students
  students = []



  loop do
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    break if name.empty?
    puts "Please enter the cohort"
    cohort = gets.chomp
    puts "Please enter student's country of birth"
    country = gets.chomp
      if country.empty?
      country = "somewhere in the world"
      end
    students << {name: name, cohort: cohort, country: country}
    if students.count > 1
    puts "Now we have #{students.count} students"
    elsif puts "Now we have 1 student"
    end
    end
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
      #if student[:name].length < 12
        puts "#{indexstartat1}. #{student[:name]}, #{student[:cohort]} cohort, born in #{student[:country]}"
      end
  end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end
#nothing happens until we can call the methods
students = input_students
print_header
print(students)
print_footer(students)
