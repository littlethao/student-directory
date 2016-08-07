@cohort_months = {
	1 => "January",
	2 => "February",
	3 => "March",
	4 => "April",
	5 => "May",
	6 => "June",
	7 => "July",
	8 => "August",
	9 => "September",
	10 => "October",
	11 => "November",
	12 => "December"
}

def input_students
	# create an empty array
	students = []
	
	add_more_students = true
	# while the name is not empty, repeat this code
	while add_more_students do
		puts "Please enter the names of the students and the cohort!"
		puts "To finish, just hit return twice"
		name = gets.gsub!(/[\r\n]/, "")
		cohort = gets.gsub!(/[\r\n]/, "")
	
		cohort = @cohort_months[cohort.to_i]
		if !cohort
			cohort = "November"
		end
	
		puts "Please add the student's hobbies."
		hobbies = gets.gsub!(/[\r\n]/, "")
		puts "What is the student's country of birth?"
		country_of_birth = gets.gsub!(/[\r\n]/, "")
		puts "Please input the student's height."
		height = gets.gsub!(/[\r\n]/, "")
		
		students << {name: name, hobbies: hobbies, birthplace: country_of_birth, height: height, cohort: cohort.to_sym}
		if students.count == 1
			puts "Now we have #{students.count} student."
		else
			puts "Now we have #{students.count} students"
		end
		puts "Would you like to add more students?"
		response = gets.chomp
		
		if response.downcase == "yes" || response.downcase == "y"
			#do nothing
		else
			add_more_students = false
		end
	end
	students
end

def print_header
	puts "The students of Villains Academy".center(50)
	puts "-------------".center(50)
end

# Rewrite the each() method that prints all students using while or until control flow methods
def print(students)
	if !students.empty?
		if students.size >= 1 && !students[0][:name].empty? && !students[0][:hobbies].empty? && !students[0][:birthplace].empty? && !students[0][:height].empty?
			index = 0
			while index < students.size 
			puts "#{index+1}. #{students[index][:name]}, #{students[index][:hobbies]}, #{students[index][:birthplace]}, #{students[index][:height]} (#{students[index][:cohort]} cohort)"
		
			index = index + 1 
			end
		end
	end
end

# Only print the students from a particular cohort.
def print_by_cohort(students, student_class)
	students.each_with_index do |student, index|
		if student[:cohort].to_s.downcase == student_class.downcase
			puts "#{index+1}. #{students[index][:name]}, #{students[index][:hobbies]}, #{students[index][:birthplace]}, #{students[index][:height]} (#{students[index][:cohort]} cohort)"
		end
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
	if students.count == 1
		puts "Overall, we have #{students.count} great student."
	else
		puts "Overall, we have #{students.count} great student."
	end
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
# print_name_starting(students)
# print_name_shorter_12(students)
# print_by_cohort(students, "November")