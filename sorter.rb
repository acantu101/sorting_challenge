require_relative 'sorting.rb'

describe Sorting do
  context "With valid input" do
  	it 'Sorts numbers before letters and ordered by bigger number and smaller letter ' do
    	b = Sorting.new
    	input_string = 'A11-a4'
    	expect(b.sort input_string).to eq("411aA-")
  	end
  end
end  
  
