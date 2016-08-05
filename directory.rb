def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	name = gets.chomp
	
	puts "Please add the student's hobbies."
	hobbies = gets.chomp
	
	puts "What is the student's country of birth?"
	country_of_birth = gets.chomp
	
	puts "Please input the student's height."
	height = gets.chomp
	
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {name: name, hobbies: hobbies, birthplace: country_of_birth, height: height, cohort: :november}
		puts "Now we have #{students.count} students"
		# get another name from the user
		name = gets.chomp
		hobbies = gets.chomp
		country_of_birth = gets.chomp
		height = gets.chomp
	end
	# return the array of students
	students
end

def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

# Rewrite the each() method that prints all students using while or until control flow methods
def print(students)
	index = 0
	while index < students.size 
		puts "#{index+1}. #{students[index][:name]}, #{students[index][:hobbies]}, #{students[index][:birthplace]}, #{students[index][:height]} (#{students[index][:cohort]} cohort)"
		
		index = index + 1 
	end
end

# Modify your program to only print the students whose name begins with a specific letter.
def print_name_starting(students)
	puts "Enter the first letter of student name you are looking for."
	letter = gets.chomp
	students.each_with_index do |student, index| 
		if student[:name].start_with?(letter) == true
			puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end

# Modify your program to only print the students whose name is shorter than 12 characters.
def print_name_shorter_12(students)
	students.each_with_index do |student, index| 
		if student[:name].length < 12
			puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end

def print_footer(students)
	puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
# print_name_starting(students)
# print_name_shorter_12(students)
