def ceasar_cipher(str, num)
	# create hash of letters => numbers
	alphabet = ""
	("a".."z").each {|letter| alphabet += letter}
	cap_alphabet = ""
	("A".."Z").each {|letter| cap_alphabet += letter}

	final_str = ""
	str.each_char do |character|
		if cap_alphabet.include?(character)
			cap = true
			character.downcase!
		elsif alphabet.include?(character)
			cap = false
		else
			final_str += character
			next
		end

		alph_index = alphabet.index(character) + num
		if alph_index > 25
			alph_index -= 26
		end
		if cap
			final_str += alphabet[alph_index].capitalize
		else
			final_str += alphabet[alph_index] 
		end
	end
	final_str
end