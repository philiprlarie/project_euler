# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require_relative "../useful_functions"
require 'byebug'

primes = sieve_of_eratosthenes(1000000)
primes_hash = sieve_of_eratosthenes_hash(1000000)

trunc_primes = []
primes.each do |prime|
  next if prime < 10
  # trunc from right
  digits = get_digits(prime)
  digits.length.times do
    break unless primes_hash[digits.join.to_i]
    digits.shift
  end
  # trunc from left
  if digits.empty?
    digits = get_digits(prime)
    digits.length.times do
      break unless primes_hash[digits.join.to_i]
      digits.pop
    end
    trunc_primes << prime if digits.empty?
  end
end

p trunc_primes.inject(:+)
