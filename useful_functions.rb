# takes a number and returns an array of the digits
def get_digits(num)
  digits = []
  while num > 0
    digits << num % 10
    num /= 10
  end
  digits.reverse
end

# efficient alogrithm for finding all primes below a certain number
def sieve_of_eratosthenes_hash(top)
	primes = {}
	i = 1
	while i <= top
		primes[i] = true
		i += 1
	end
  primes[1] = false
	i = 2
	while i < top
		if primes[i] == true
			j = 2
			while i * j <= top
				primes[i * j] = false
				j += 1
			end
		end
		i += 1
	end
	primes
end
def sieve_of_eratosthenes(top)
  sieve_of_eratosthenes_hash(top).delete_if { |k, v| !v }.keys
end

# finds all prime factors of a number
# best case O(log(n)), worst case O(n)
def find_prime_factors_dumb(numb)
	factors = []
	while numb > 1
		test_num = 2
		while true
			if is_factor?(numb, test_num)
				factors << test_num
				break
			end
			test_num += 1
		end
		numb = numb/test_num
	end
	return factors
end
def is_factor?(numb, factor)
	return true if numb % factor == 0
	return false
end

# this will take some time to find all the primes. once we find them, we at most will be doing O(log(num)) operations. The limiting factor is the seive. time complexity = O(sieve_of_eratosthenes(num ** 1/2))
def find_prime_factors(num)
  primes = sieve_of_eratosthenes(Math.sqrt(num)) # bottle neck is here
  factors = []
  idx_primes = 0
	while idx_primes != primes.length && num > primes[idx_primes]
    if num % primes[idx_primes] == 0
      factors << primes[idx_primes]
  		num /= primes[idx_primes]
    else
      idx_primes += 1
    end
	end
  factors << num if num > 1
	return factors
end

# least common multiple of two numbers
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
	all_factors.inject(:*)
end

def factorial(n)
  raise "factorial must take an integer, 0 or greater" if n < 0
  (1..n).inject(:*)
end
