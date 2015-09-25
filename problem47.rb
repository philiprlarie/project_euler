# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 × 7
# 15 = 3 × 5
#
# The first three consecutive numbers to have three distinct prime factors are:
#
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
#
# Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?

require_relative "./useful_functions.rb"

PRIMES = sieve_of_eratosthenes(1000000)

def find_prime_factors(num)
  factors = []
  idx_primes = 0
	while idx_primes != PRIMES.length && num > PRIMES[idx_primes]
    if num % PRIMES[idx_primes] == 0
      factors << PRIMES[idx_primes]
  		num /= PRIMES[idx_primes]
    else
      idx_primes += 1
    end
	end
  factors << num if num > 1
	return factors
end

def num_uniq_prime_factors(num)
  find_prime_factors(num).uniq.length
end

num_uniq_primes_arr = [1, 1, 1, 1]
test_num = 6
while num_uniq_primes_arr[-1] != 4 || num_uniq_primes_arr[-2] != 4 || num_uniq_primes_arr[-3] != 4 || num_uniq_primes_arr[-4] != 4
  p test_num
  num_uniq_primes_arr << num_uniq_prime_factors(test_num)
  test_num += 1
end

p test_num - 4
