require 'my_methods'

num_arr = [1,2,4,7,11]

str_arr = ["abc","123","I love you"]

chr_arr = ["a","b","c","x","y","z"]

describe "#my_select" do
	context "when given an array of numbers" do
		it "returns numbers > 4" do
			expect(num_arr.my_select {|num| num > 4}).to eql([7,11])
		end
	end

	context "when given an array of strings" do
		it "returns strings with a length > 3" do
			expect(str_arr.my_select {|str| str.length > 3}).to eql(["I love you"])
		end
	end
end

describe "#my_all?" do
	it "returns true if block is all numbers" do
		expect(chr_arr.my_all? {|chr| chr.length == 1}).to eql(true)
	end
end

describe "#my_map" do
	it "returns a new array" do
		expect(str_arr.my_map {|str| str * 2}).to eql(["abcabc","123123","I love youI love you"])
	end
end

describe "#my_inject" do
	it "returns the sum of all numbers in the array" do
		expect(num_arr.my_inject {|sum,num| sum += num}).to eql(25)
	end
end