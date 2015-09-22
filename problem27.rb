# Euler discovered the remarkable quadratic formula:
#
# n² + n + 41
#
# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
#
# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
#
# Considering quadratics of the form:
#
# n² + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
MAX_PRIME_CONSIDERED = 1000000
PRIMES_HASH = {}
MAX_PRIME_CONSIDERED.times { |idx| PRIMES_HASH[idx + 1] = true }
PRIMES_HASH[1] = false

i = 1
while i < Math.sqrt(MAX_PRIME_CONSIDERED)
  i += 1
  next unless PRIMES_HASH[i]
  j = 2
  while j * i <= MAX_PRIME_CONSIDERED
    PRIMES_HASH[j * i] = false
    j += 1
  end
end



def get_answer
  num_primes_hash = {}
  (0..999).each do |b|
    (-999..999).each do |a|
      num_primes_hash[[a,b]] = num_primes(a, b)
    end
  end

  return num_primes_hash.max_by { |k, v| v }
end

def num_primes(a, b)
  i = 0
  while is_prime?(i ** 2 + i * a + b)
    i += 1
  end
  return i
end

def is_prime?(num)
  raise "outside of considered bound" if num >= MAX_PRIME_CONSIDERED
  return false if num < 2
  PRIMES_HASH[num]
end

if $PROGRAM_NAME == __FILE__
  p get_answer
end
