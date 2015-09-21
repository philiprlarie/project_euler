# finds prime factorization of a number


def find_prime_factors(numb)
	factors = []

	while numb > 1
		test_num = 2 # to improve efficiency consider chaning this line. start counting from higher.
					#or maybe only test primes (use sieve of eratosthenes to find all primes less than num?)
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

def is_factor?(numb,factor)
	return true if numb%factor == 0
	return false
end

p find_prime_factors(40)
