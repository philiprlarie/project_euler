# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

require_relative "../useful_functions.rb"

primes_hash = sieve_of_eratosthenes_hash(1000000)
primes = sieve_of_eratosthenes(1000000)

good_primes = []
primes.each do |prime|
  digits = get_digits(prime)
  flag = true
  (digits.length - 1).times do
    digits.rotate!
    flag = false unless primes_hash[digits.join("").to_i]
  end
  good_primes << prime if flag
end

p good_primes.length
