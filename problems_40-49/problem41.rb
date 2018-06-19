# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?


# 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 == 45 so we know any pandigital of 9 digits long will be divisible by 3, therefore not prime.
# the same can be said for pandigitals with 8 digits (1 + ... + 8) == 36
# it is computationally feasable to calculate all the primes under 10_000_000. takes about 50 seconds. by the prime number theorem, there should be about N/log(N) primes that come out of this. that is ~ 620420 primes to test for pandigitalness
require_relative "../useful_functions.rb"

def is_pandigital_num?(num)
  str = num.to_s
  return false if str.length > 9
  (1..str.length).each do |test_digit|
    return false unless str.include?(test_digit.to_s)
  end
  true
end

primes = sieve_of_eratosthenes(10000000)

pandigital_primes = []
primes.each do |prime|
  pandigital_primes << prime if is_pandigital_num?(prime)
end

p pandigital_primes
