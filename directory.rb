@students = [] # an empty array accessible to all methods

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
	add_more_students = true
	# while the name is not empty, repeat this code
	while add_more_students do
		puts "Please enter the names of the students and the cohort!"
		puts "To finish, just hit return twice"
		name = gets.chomp
		cohort = gets.chomp
	
		cohort = @cohort_months[cohort.to_i]
		if !cohort
			cohort = "November"
		end
	
		puts "Please add the student's hobbies."
		hobbies = gets.chomp
		puts "What is the student's country of birth?"
		country_of_birth = gets.chomp
		puts "Please input the student's height."
		height = gets.chomp
		
		@students << {name: name, hobbies: hobbies, birthplace: country_of_birth, height: height, cohort: cohort.to_sym}
		if @students.count == 1
			puts "Now we have #{@students.count} student."
		else
			puts "Now we have #{@students.count} students"
		end
		puts "Would you like to add more students?"
		response = gets.chomp
		
		if response.downcase == "yes" || response.downcase == "y"
			#do nothing
		else
			add_more_students = false
		end
	end
	@students
end

def print_header
	puts "The students of Villains Academy".center(50)
	puts "-------------".center(50)
end

# Rewrite the each() method that prints all students using while or until control flow methods
def print_students_list
	if !@students.empty?
		if @students.size >= 1 && !@students[0][:name].empty? && !@students[0][:hobbies].empty? && !@students[0][:birthplace].empty? && !@students[0][:height].empty?
			index = 0
			while index < @students.size 
			puts "#{index+1}. #{@students[index][:name]}, #{@students[index][:hobbies]}, #{@students[index][:birthplace]}, #{@students[index][:height]} (#{@students[index][:cohort]} cohort)"
		
			index = index + 1 
			end
		end
	end
end

def print_footer
	if @students.count == 1
		puts "Overall, we have #{@students.count} great student."
	else
		puts "Overall, we have #{@students.count} great student."
	end
end

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
	print_header
	print_students_list
	print_footer
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "9"
			exit
		else
			puts "I don't know what you meant, try again."
	end
end

students = interactive_menu