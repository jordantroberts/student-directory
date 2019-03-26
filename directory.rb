def input_students
  students = []



  loop do
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    break if name.empty?
    puts "Please enter the cohort"
    cohort = gets.chomp
   # puts "Please enter student's country of birth"
   # country = gets.chomp
     # if country.empty?
      #country = "somewhere in the world"
      #end
    students << {name: name, cohort: cohort}
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
students.group_by { |student| student.class }
students_by_cohort = {}
students.map do |student|
  name = student[:name]
  cohort = student[:cohort]
if students_by_cohort[cohort] == nil
  students_by_cohort[cohort] = []
  end
  students_by_cohort[cohort].push(student[:name])
  end
  puts students_by_cohort.to_a
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end
#nothing happens until we can call the methods
students = input_students
print_header
print(students)
print_footer(students)
