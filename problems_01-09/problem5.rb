# What is the smallest positive number 
# that is evenly divisible by all of the numbers from 1 to 20?

def is_factor?(numb,factor)
	return true if numb%factor == 0
	return false
end

def find_prime_factors(numb)
	factors = []

	while numb > 1
		test_num = 2
		while true
			if is_factor?(numb,test_num)
				factors << test_num
				break
			end
			test_num += 1
		end
		numb = numb/test_num
	end

	return factors
end

def lcm(n,m)
	factors_n = find_prime_factors(n)
	factors_m = find_prime_factors(m)

	if factors_n.count > factors_m.count
		longer = factors_n
		shorter = factors_m
	else
		longer = factors_m
		shorter = factors_n
	end


	longer.each do |l_factor|
		if shorter.include?(l_factor)
			shorter.delete_at(shorter.find_index(l_factor))
		end
	end

	all_factors = longer + shorter

	lcm = 1
	all_factors.each {|factor| lcm *= factor}

	return lcm

end

def first_how_many(max)
	numbers = (1..max).to_a

	big_lcm = 1

	numbers.each {|number| big_lcm = lcm(big_lcm,number)}

	return big_lcm
end

p first_how_many(20)


#wont work because too many operatons
# def cheap_way(max)
# 	test_num = max
# 	numbers = (1..max).to_a

# 	while true
# 		return test_num if numbers.all? {|number| test_num%number == 0}
# 		test_num += 1
# 	end
# end

# p cheap_way(18)










