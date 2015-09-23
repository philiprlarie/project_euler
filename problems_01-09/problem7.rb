# What is the 10 001st prime number?


def prime_num(how_many_primes)

	primes = [2]

	test = 2+1

	while primes.length < how_many_primes
		if primes.all? { |prime| test % prime != 0}
			primes << test
		end
		test += 1
	end

	return primes.last
end

p prime_num(10001)
