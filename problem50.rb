# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

require_relative "./useful_functions.rb"
PRIMES = sieve_of_eratosthenes_hash(1000000)
primes = sieve_of_eratosthenes(1000000)

answer = nil
num_primes = 2
continue = true
while continue
  continue = false
  i = 0
  sum = 0
  while sum < 1000000
    sum = 0
    num_primes.times { |j| sum += primes[i + j] }
    continue = true if sum < 1000000 # continue will be false when the first sum (starting with 2 + 3 + ... + n[num_primes]) is greater than 1000000. there is no possible longer sum to worry about
    if PRIMES[sum]
      puts "#{sum}, #{num_primes}"
      answer = sum
      biggest_num_primes = num_primes
      break
    end
    i += 1
  end
  num_primes += 1
end
