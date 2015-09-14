# What is the largest prime factor of the number 600851475143 ?

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

p find_prime_factors(600851475143).max

