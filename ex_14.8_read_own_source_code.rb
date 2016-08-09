def print_own_code
	File.open($0, "r") {|file|
		file.readlines.each do |line|
			puts line
	end
	}
end

print_own_code