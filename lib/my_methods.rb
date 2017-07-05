module Enumerable

	def my_each
		i = 0
		while i < self.length
			yield(self[i])
			i += 1
		end
		self
  	end

  	def my_each_with_index
	  	i = 0
	  	while i < self.length
	  		yield(self[i], i)
	  		i += 1
	  	end
	  	self
	end

	# [0,7,5,63,2].select {|x| x > 5}
	# => [7,63]
	def my_select
		new_arr = []
		
		self.my_each do |x|
			if yield(x)
				new_arr << x
			end
		end
		new_arr
	end

	def my_all?
		if block_given?
			self.my_each do |x|
				if yield(x) == false || yield(x) == nil
					return false
				end
			end
		else
			implicit_block = Proc.new { |obj| obj}
			self.my_each { |x| return false unless implicit_block.call(x) }
		end
		true
	end

	def my_any?
		if block_given?
			self.my_each { |x| return true if yield(x)}
		else
			implicit_block = Proc.new { |obj| obj}
			self.my_each { |x| return true if implicit_block.call(x)}
		end
		false
	end

	def my_none?
		if block_given?
			self.my_each { |x| return false if yield(x) }
		else
			implicit_block = Proc.new {|obj| obj}
			self.my_each { |x| return false if implicit_block.call(x) }
		end
		true
	end

	def my_count
		counter = 0
		if block_given?
			self.my_each { |x| counter += 1 if yield(x) }
		else
			return self.length
		end
		counter
	end

	def my_map(a_proc=nil)
		new_arr = []
		if a_proc.nil?
			self.my_each { |x| new_arr.push(yield(x)) }
		else
			self.my_each { |x| new_arr.push(a_proc.call(x)) }
		end
		new_arr
	end

	def my_inject(start = 0)
		accum = start
		self.my_each { |x| accum = yield(accum, x) }
		accum
	end

	def multiple_els(arr)
		result = arr.my_inject(1) { |total, num| total * num}
	end
end