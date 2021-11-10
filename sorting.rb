class Sorting
	
	attr_accessor :new_array,:number_string
	
	def comparator(x, y)
	  if y.class == x.class
		return x <=> y
	  else
		return x.class.to_s <=> y.class.to_s
	  end
	end

	def process_int
		number = @number_string.to_i
		new_array.push(number)
		@number_string = ''
	end

	def create_array_sort(input_string)
		string = input_string
		array_string = string.split('')
		@new_array = Array.new()
		@number_string = ''
		array_string.each{ |char| 
		  if char.to_i.to_s == char
			@number_string = @number_string + char
		  else
			if @number_string != ''
			  process_int
			end
			new_array.push(char)
		  end
		}
		if @number_string != ''
			process_int
		end

		sorted_array = new_array.sort{ |x, y| comparator(x, y) }
		return final_sort(sorted_array)
	end
	
	def final_sort(sorted_array)
		numbers_array = Array.new()
		upper_array = Array.new()
		lower_array = Array.new()
		special_array = Array.new()
		sorted_array.each{ |entry|
		  if entry.is_a? Integer
			numbers_array.push(entry)
		  elsif entry !~ /[a-zA-Z]/
		  	special_array.push(entry)
		  elsif entry == entry.downcase
			lower_array.push(entry)
		  elsif entry == entry.upcase
			upper_array.push(entry)
		  end
		}
		final_array = numbers_array + lower_array + upper_array + special_array
		return final_array
	end

	def sort(input_string)
		final_array = create_array_sort(input_string)
		output_string = ''
		final_array.each{ |entry|
			output_string = output_string + entry.to_s
		}
		return output_string
	end

end  
