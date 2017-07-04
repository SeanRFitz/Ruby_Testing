require_relative '../lib/ceasar_cipher'

describe "#ceasar_cipher" do
	context "with only lowercase letters" do
		it "returns the cipher" do
			expect(ceasar_cipher('i made',1)).to eql("j nbef")
		end
	end

	context "with uppercase letters" do
		it "returns the cipher" do
			expect(ceasar_cipher("I AM TALL",3)).to eql("L DP WDOO")
		end
	end

	context "with upper and lowercase letters" do
		it "returns the cipher" do
			expect(ceasar_cipher("hOw ArE You?",1)).to eql("iPx BsF Zpv?")
		end
	end

	context "with the z character" do
		it "returns the cipher" do
			expect(ceasar_cipher("zZzZ",3)).to eql("cCcC")
		end
	end

	context "with '' passed into the method" do
		it "returns ''" do
			expect(ceasar_cipher('',5)).to eql('')
		end
	end
end