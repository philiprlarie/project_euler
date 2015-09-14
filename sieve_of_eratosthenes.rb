# efficient alogrithm for finding all primes below a certain number

def sieve_of_eratosthenes(top)
	primes = Hash.new(true)
	i = 2
	while i <= top
		primes[i] = true
		i += 1
	end

	i = 2
	while i < top
		if primes[i] == true
			j = i
			while i*j <= top
				primes[i*j] = false
				j += 1
			end
		end
		i += 1
	end

	return primes
end
