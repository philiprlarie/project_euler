# What is the value of the first triangle number to have over five hundred divisors?

def triangle_num(n)
	sum = 0
	for i in 1..n
		sum += i
	end
	return sum
end

def num_divisors(n)
	prime_factorization = find_prime_factors(n)
	prime_factors_count = Hash.new(0)

	prime_factorization.each {|factor| prime_factors_count[factor] += 1}

	num_factors = 1

	primes_count = prime_factors_count.values

	primes_count.each {|count| num_factors *= count+1}

	return num_factors

end


def problem12
	how_many_divisors = 0
	triangle_num_base = 1

	while how_many_divisors <= 500
		triangle_num = triangle_num(triangle_num_base)
		how_many_divisors = num_divisors(triangle_num)
		triangle_num_base += 1
	end

	return triangle_num

end


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

p problem12
####### too slow
# def num_divisors(n)
# 	divisors = [1,n]

# 	for div in 2..(n/2)
# 		divisors << div if n%div == 0
# 	end

# 	return divisors.count
# end