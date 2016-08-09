@students = [] # an empty array accessible to all methods


def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save list"
	puts "4. Load list"
	puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def process(selection)
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "3"
		puts "Please input a filename to save the list."
		list_to_save = gets.chomp
		save_students(list_to_save)
	when "4"
		puts "Please input the filename you wish to load."
		list_to_load = gets.chomp
		load_students(list_to_load)
	when "9"
		exit # this will cause the program to terminate
	else
		puts "I don't know what you meant, try again"
	end
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# get the first name
	name = STDIN.gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		add_student(name)
		puts "Now we have #{@students.count} students"
		# get another name from the user
		name = STDIN.gets.chomp
	end
end

def show_students
	print_header
	print_student_list
	print_footer
end

def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

def print_student_list
	@students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer
	puts "Overall, we have #{@students.count} great students"
end

def save_students(filename)
	# open the file for writing
	file = File.open(filename, "w")
	# iterate over the array of students
	@students.each do |student|	
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	puts "The list has now been saved successfully."
end

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		add_student(name, cohort.to_sym)
	end
	file.close
	puts "The list has now been loaded successfully"
end

def try_load_students
	filename = ARGV.first# first argument from the command line
	if filename.nil?
		load_students
		puts "Loaded #{@students.count} from students.csv"
	elsif File.exists?(filename) # if it exists	
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end

def add_student(name, cohort = :november)
	@students << {name: name, cohort: cohort}
end

try_load_students
interactive_menu