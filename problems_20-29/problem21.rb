# require_relative "sieve_of_eratosthenes.rb"
# primes_under_100 = sieve_of_eratosthenes(100)
# p primes_under_100
#
# prime_factorization = {}

nums = (2..10000)
factor_sums = nums.map do |num|
  factors = []
  (1..(num/2)).each do |factor|
    factors << factor if num % factor == 0
  end

  factors.inject(:+)
end

h = nums.zip(factor_sums).to_h

h.delete_if { |k, v| k == v }

sum = 0
h.each do |k, v|
  sum += k if h[v] == k
end

p sum
