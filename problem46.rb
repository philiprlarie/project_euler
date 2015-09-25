# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#
# 9 = 7 + 2×12
# 15 = 7 + 2×22
# 21 = 3 + 2×32
# 25 = 7 + 2×32
# 27 = 19 + 2×22
# 33 = 31 + 2×12
#
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
require_relative "./useful_functions.rb"
MAX_TESTED = 1000000
primes = sieve_of_eratosthenes(MAX_TESTED + 1)
squares = (0..Math.sqrt(MAX_TESTED)).to_a.map { |num| num ** 2 }
odds = (1..(MAX_TESTED / 2)).to_a.map { |num| num * 2 + 1}

answer = nil
odds.each do |odd|
  p odd
  has_combo = false
  prime_idx = 0
  while primes[prime_idx] <= odd
    square_idx = 0
    while primes[prime_idx] + 2 * squares[square_idx] <= odd
      has_combo = true if odd == primes[prime_idx] + 2 * squares[square_idx]
      square_idx += 1
    end
    break if !!has_combo
    prime_idx += 1
  end
  if !has_combo
    answer = odd
    break
  end
end

p answer
